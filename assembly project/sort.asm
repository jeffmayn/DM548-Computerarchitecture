.section .data
buffer:
        .space 8
file_stat:	.space 144	#Size of the fstat struct
.section .text
.globl _start

_start:
  mov 16(%rsp), %rcx

# open file
  mov $2, %rax
  mov %rcx, %rdi
  mov $0, %rsi
  mov $2, %rdx
  syscall

# lets get filesize
  push %rax                 # push register rax to stack
  call get_file_size        # call get_file_size and save in register rax
  call print_rax
  pop %r9                   # pop stack and move to register r9

# allocate memory
  push %rax                 # push rax to stack
/call alloc_mem            # allocate memory based on rax
  //pop %r8                   # pop stack and mov to register r8

  //mov %r9,%rax
  //call print_rax

  //mov %rax, %rcx

/*
# read chars from file
  mov $0, %rax
  mov %rcx, %rdi
  mov $buffer, %rsi
  mov $3, %rdx
  syscall

# write string to stdout
  mov $1, %rax
  mov $0, %rdi
  mov $buffer,%rsi
  mov $3, %rdx
  syscall
*/

# Syscall calling sys_exit
  mov $60, %rax
  mov $0, %rdi
  syscall

# get file size-function
 .type get_file_size, @function
get_file_size:
	push 	%rbp
	mov 	%rsp,%rbp 		#Function Prolog

	#Get File Size
	mov		$5,%rax			#Syscall fstat
	mov		16(%rbp),%rdi	#File Handler
	mov		$file_stat,%rsi	#Reserved space for the stat struct
	syscall
	mov		$file_stat, %rbx
	mov		48(%rbx),%rax	#Position of size in the struct

	mov		%rbp,%rsp		#Function Epilog
	pop 	%rbp
	ret

  .type print_rax, @function
  print_rax:
    /* Prints the contents of rax. */

    push  %rbp
    mov   %rsp, %rbp        # function prolog

    push  %rax              # saving the registers on the stack
    push  %rcx
    push  %rdx
    push  %rdi
    push  %rsi
    push  %r9

    mov   $6, %r9           # we always print the 6 characters "RAX: \n"
    push  $10               # put '\n' on the stack

    loop1:
    mov   $0, %rdx
    mov   $10, %rcx
    idiv  %rcx              # idiv alwas divides rdx:rax/operand
                            # result is in rax, remainder in rdx
    add   $48, %rdx         # add 48 to remainder to get corresponding ASCII
    push  %rdx              # save our first ASCII sign on the stack
    inc   %r9               # counter
    cmp   $0, %rax
    jne   loop1             # loop until rax = 0

    mov   $0x20, %rax       # ' '
    push  %rax
    mov   $0x3a, %rax       # ':'
    push  %rax
    mov   $0x58, %rax       # 'X'
    push  %rax
    mov   $0x41, %rax       # 'A"
    push  %rax
    mov   $0x52, %rax       # 'R'
    push  %rax

    print_loop:
    mov   $1, %rax          # Here we make a syscall. 1 in rax designates a sys_write
    mov   $1, %rdi          # rdx: int file descriptor (1 is stdout)
    mov   %rsp, %rsi        # rsi: char* buffer (rsp points to the current char to write)
    mov   $1, %rdx          # rdx: size_t count (we write one char at a time)
    syscall                 # instruction making the syscall
    add   $8, %rsp          # set stack pointer to next char
    dec   %r9
    jne   print_loop

    pop   %r9               # restoring the registers
    pop   %rsi
    pop   %rdi
    pop   %rdx
    pop   %rcx
    pop   %rax

    mov   %rbp, %rsp        # function Epilog
    pop   %rbp
    ret

.type alloc_mem, @function
alloc_mem:
    	push 	%rbp
    	mov 	%rsp,%rbp 		#Function Prolog

    	#First, we need to retrieve the current end of our heap
    	mov		$0,%rdi
    	mov		$12,%rax
    	syscall					#The current end is in %rax
    	push	%rax			#We have to save this, this will be the beginning of the cleared field
    	add		16(%rbp),%rax	#Now we add the desired additional space on top of the current end of our heap
    	mov		%rax,%rdi
    	mov		$12,%rax
    	syscall

    	pop		%rax
    	mov		%rbp,%rsp		#Function Epilog
    	pop 	%rbp
    	ret
