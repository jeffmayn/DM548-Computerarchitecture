.section .data
buffer:
        .space 8
file_stat:	.space 144	#Size of the fstat struct
.section .text
.globl _start

_start:
  mov 16(%rsp), %rcx

  #open file
  //call get_file_size
  mov $2, %rax
  mov %rcx, %rdi
  mov $0, %rsi
  mov $2, %rdx
  syscall

  mov %rax, %rcx

# ༼ つ ◕_◕ ༽つ <( read chars from file )
  mov $0, %rax
  mov %rcx, %rdi
  mov $buffer, %rsi
  mov $32, %rdx
  syscall

# ༼ つ ◕_◕ ༽つ <( write string to stdout )
  mov $1, %rax
  mov $0, %rdi
  mov $buffer,%rsi
  mov $32, %rdx
  syscall


# ༼ つ ◕_◕ ༽つ <( Syscall calling sys_exit )
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
