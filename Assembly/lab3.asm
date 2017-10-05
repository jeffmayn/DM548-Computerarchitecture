.section .data
guess:
	.string "Guess a number between 0 /and 100\nType your guess:\n"
answerOver:
	.string "you guessed too high\n"
answerLow:
	.string "you guessed too low\n"
answer:
  .string "you guessed correct!\n"
buffer:
  .space 20
path:
 .ascii "/dev/urandom"
number:
	.string "11"
.section .text
.globl _start

_start:
# 1. Guessing Game
# first print some game instructions
mov $1, %rax
mov $1, %rdi
mov $guess,%rsi
mov $52,%rdx
syscall

# read string from stdin
mov $0, %rax
mov $0, %rdi
mov $buffer, %rsi
mov $3, %rdx
syscall
mov $buffer,%rax
call string_to_int
mov %rax,%r9

mov $number,%rax
call string_to_int
cmp %rax,%r9
jl low
jg high
je slut

low:
# guessed low
mov $1, %rax
mov $1, %rdi
mov $answerLow,%rsi
mov $21,%rdx

syscall

jmp _start

high:
mov $1, %rax
mov $1, %rdi
mov $answerOver,%rsi
mov $22,%rdx
syscall
jmp _start

slut:
mov $1, %rax
mov $1, %rdi
mov $answer,%rsi
mov $22,%rdx
syscall




  # Syscall calling sys_exit
  mov $60, %rax            # rax: int syscall number
  mov $0, %rdi             # rdi: int error code
  syscall

.type string_to_int, @function
string_to_int:
  /* Converts a string to an integer. Returns the integer in %rax.
   * %rax: Address of string to convert.
   */

  push %rbp
  mov %rsp, %rbp

  push %rbx
  push %rcx
  push %r8

  mov %rax, %r8

  xor %rax, %rax
  convertloop:
    movzx (%r8), %rbx     # moves a single character from the string in memory to %rbx
    cmp $48, %rbx         # If the character is anything less than ascii number 48, then we have reached the end.
  jl convertdone
    mov $10, %rcx
    mul %rcx              # mult multiplies %rax with the given operand and saves the result in %rdx:%rax.
                          # I multiply by 10 to shift the number one placement to the right to add the newest integer.
    sub $48, %rbx         # In ascii, numbers start at 0 = 48, 1 = 49, 2 = 50 and so on. So I subtract 48 to get the digit.
    add %rbx, %rax        # I add the newly read digit to our final integer.
    inc %r8               # Increment the pointer to get the next character.
  jmp convertloop
  convertdone:

  pop %r8
  pop %rcx
  pop %rbx

  mov %rbp, %rsp
  pop %rbp
  ret
