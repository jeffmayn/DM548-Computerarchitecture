.include "file_handling.asm"
.include "alloc.asm"
.include "print_rax.asm"
.include "parsing.asm"
.include "print.asm"

.section .data
.section .text
  .globl _start

_start:
mov 16(%rsp), %rcx            # read from command-line argument

####### open file #######
mov $2, %rax
mov %rcx, %rdi
mov $0, %rsi
mov $0, %rdx
syscall                       # fd in %rax

####### lets get filesize #######
mov %rax, %r15                # file descriptor
push %rax                     # push register rax to stack
call get_file_size            # call get_file_size and save in register rax

####### allocate memory #######
push %rax
mov %rax, %r14                # file size
call alloc_mem                # memory location
mov %rax, %r13                # memory location

####### read chars from file #######
mov $0, %rax
mov %r15, %rdi                # %rcx is file descriptor for our file
mov %r13, %rsi                # we want to save string in "buffer"
mov %r14, %rdx                # number of bytes we want to read (8 characters)
syscall

####### get number count #######
push %r14                     # pusher filesize on stack
push %r13                     # pusher pointer of raw data
call get_number_count
push %rax

######## allocate memory and parse number #######
imul $8, %rax                 # multiply rax by 8, every nr fills 8 bite on number
push %rax
call alloc_mem                # allocate memory for the second buffer
mov %rax, %r8                 # to store in a buffer %r8

push %r8                      # pointer number array
push %r14                     # filesize
push %r13                     # pointer raw data

call parse_number_buffer
pop %r13                      # remove pointer of raw data from stack
pop %r14                      # remove filesize of raw data from stack
pop %r8                       # remove pointer for number array
pop %r12                      # remove unused value from memory allocation above
pop %r12                      # place numbercount in r12

######## Bubble sort #######
mov $1, %rcx                  # the first number in the list
mov $0, %rax                  # this is to cmp counter #(SKAL IKKE I FÆRDIG KODE)

outer_loop:
mov %r12, %rsi                # the size of the array size of list

inner_loop:
mov -8(%r8, %rsi, 8), %r9     # 8 bytes back, first number put in the list
inc %rax                      # (SKAL IKKE I FÆRDIG KODE)
cmp %r9, -16(%r8, %rsi, 8)    # compairs number by its predesessor
jle skip                      # switch 2 numbers or move on in the array to next 2 numbers
mov -16(%r8, %rsi, 8), %r10   # second number on the list
mov %r10, -8(%r8, %rsi, 8)    # swaps the two lines
mov %r9, -16(%r8, %rsi, 8)

skip:
dec %rsi                      # decrements on the array, move to next number
cmp %rcx, %rsi                # the inner_loop runs for each unsorted number
jne inner_loop
inc %rcx
cmp %rcx, %r12
jg outer_loop

call print_rax                # (SKAL IKKE I FÆRDIG KODE)

######## print number #######
mov $0, %rcx                  # initilise counter by starting it with 0

print_loop2:                  # loop to counter
push (%r8, %rcx, 8)           # take number from array and push on the stack.

call print_number             # print number current counter index (rcx)
inc %rcx                      # incrementing counter by 1
cmp %rcx, %r12                # have we reached the last number (the end!)
jne print_loop2

###### Close file #######
mov $3, %rax                  # closes the file that we open at the start.
mov $3, %rdi
syscall

###### Exit #######
mov $60, %rax
mov $0, %rdi
syscall
