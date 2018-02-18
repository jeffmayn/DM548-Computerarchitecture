.include "file_handling.asm"
.include "alloc.asm"
.include "print_rax.asm"
.include "parsing.asm"
.include "print.asm"

.section .data
.section .text
 .globl _start

_start:
mov 16(%rsp), %rcx            # read filename from command-line argument.

####### open file ##############
mov $2, %rax
mov %rcx, %rdi
mov $0, %rsi
mov $0, %rdx
syscall                       # save file descriptor in rax.

####### lets get filesize #######
mov %rax, %r15                # cp file descriptor to r15 for later use.
push %rax                     # push file descripter to stack (so 'get_file_size read' can read it).
call get_file_size            # Returns file-size in rax.

####### allocate memory ########
push %rax                     # push file-size to stack (so 'alloc_mem' can read it).
mov %rax, %r14                # cp file-size to r14 for later use.
call alloc_mem                # Returns address of allocated memory for first buffer, to rax.
mov %rax, %r13                # cp adress of allocated memory to r13 for later use.

####### read chars from file #######
mov $0, %rax
mov %r15, %rdi                # r15 is file descriptor for our file.
mov %r13, %rsi                # we want to save string in "buffer".
mov %r14, %rdx                # number of bytes we want to read.
syscall

####### get number count #########
push %r14                     # push file-size on stack (so 'get_number_count' can read it).
push %r13                     # push the address of the raw data in memory to stack (so 'get_number_count' can read it).
call get_number_count         # Returns number count for the file, to rax.
push %rax                     #

######## allocate memory and parse number #######
imul $8, %rax                 # Because all the numbers are eight bits, we multiply number count by eight.
push %rax                     # Then push this number to stack (so 'alloc_mem' can read it).
call alloc_mem                # Returns address of allocate memory for the second buffer, to rax.
mov %rax, %r8                 # cp address of buffer to r8.

push %r8                      # push address of second buffer to stack ('parse_number_buffer's first argument').
push %r14                     # push file-size to stack ('parse_number_buffer's second argument').
push %r13                     # push address of raw data to stack ('parse_number_buffer's third argument').

call parse_number_buffer      # Reads from stack, and parses the raw date to integers and save them in the second buffer (r8).
pop %r13                      # pop address of first buffer (raw data) to r13
pop %r14                      # pop file-size raw data to r14
pop %r8                       # pop address of second buffer (integer data) to r8
pop %r12                      # pop unused value from memory (to r12, because its going to be overwritten anyways)
pop %r12                      # pop number count to r12 for use in sorting algorithm.

######## Bubble sort #######
# Bubble sort, based on pseudo-code:
#   for i = 1 to n
#     for j = n to i + 1
#       if A[j] < A[j - 1]
#         swap A[j], A[j-1]

mov $1, %rcx                  # i = 1 (the first number).

outer_loop:                   # the first for-loop.
mov %r12, %rsi                # cp number count to rsi (n = number count or 'array-size').

inner_loop:                   # the nested for-loop.
mov -8(%r8, %rsi, 8), %r9     # we cp our first number at offset -8 in the stack, at the address of our second buffer (r8) into r9,
cmp %r9, -16(%r8, %rsi, 8)    # then we compare this number by its predesessor.
jle skip                      # if the number is less or equal to its predesessor, we skip it (jump to skip),
mov -16(%r8, %rsi, 8), %r10   # else we swap the two numbers.
mov %r10, -8(%r8, %rsi, 8)
mov %r9, -16(%r8, %rsi, 8)

skip:
dec %rsi                      # decrements n (array-size)
cmp %rcx, %rsi                # the inner_loop runs for each unsorted number
jne inner_loop
inc %rcx
cmp %rcx, %r12
jg outer_loop

######## print number #######
mov $0, %rcx                  # initilise counter to zero

print_loop2:
push (%r8, %rcx, 8)           # take number from array and push on the stack.

call print_number             # print number at current counter index (rcx)
inc %rcx                      # incrementing counter by 1 (next number)
cmp %rcx, %r12                # have we reached the last number? (the end)
jne print_loop2               # if not, run loop again.

###### Close file #######
mov $3, %rax                  # closes the file that we open at the start.
mov $3, %rdi
syscall

###### Exit #######
mov $60, %rax
mov $0, %rdi
syscall
