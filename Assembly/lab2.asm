.section .data
  hello:
    .string "Hello world!\n"

.section .text
.globl _start

_start:

  # 1. Hello world
  mov $1, %rax
  mov $1, %rdi
  mov $hello,%rsi
  mov $13,%rdx
  syscall

  mov $60, %rax
  mov $0, %rdi
  syscall

  # 2. Use command line arguments:
  # this function is not generic, so if the argument is less than
  # register-size, you will get random bits from the memory
  mov 16(%rsp), %r8
  mov $1, %rax
  mov $1, %rdi
  mov %r8,%rsi
  mov $20,%rdx
  syscall

  mov $60, %rax
  mov $0, %rdi
  syscall

  # 2. Use command line arguments:
  # this time the function is generic, and only prints the argument.
  mov 16(%rsp), %r8
  mov %r8, %rax
  call get_string_length
  mov %rax, %rdx
  mov $1, %rax
  mov $1, %rdi
  mov %r8,%rsi
  syscall

  mov $60, %rax
  mov $0, %rdi
  syscall

.type get_string_length, @function
get_string_length:
  /* Dertermines the length of a zero-terminated string. Returns result in %rax.
   * %rax: Address of string.
   */
  push %rbp
  mov %rsp, %rbp

  push %rcx
  push %rbx
  push %rdx
  push %rsi
  push %r11

  xor %rdx, %rdx

  # Get string length
  lengthLoop:
    movb (%rax), %bl    # Read a byte from string
    cmp $0, %bl         # If byte == 0: end loop
  je lengthDone
    inc %rdx
    inc %rax
  jmp lengthLoop
  lengthDone:

  mov %rdx, %rax

  pop %r11
  pop %rsi
  pop %rdx
  pop %rbx
  pop %rcx

  mov %rbp, %rsp
  pop %rbp
  ret
