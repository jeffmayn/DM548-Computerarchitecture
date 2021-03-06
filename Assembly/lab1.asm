.section .data
.section .text
.globl _start

_start:



  # Assignment solutions here
  
# 1. Output
mov $42,%rax # moves constant 42 into register rax

# 2. Looping
mov $0,%rdx # move constant 0 to register rdx
loop2: # label
add %rax,%rdx # add register rax to rdx
sub $1,%rax # subtract 1 from register rax
cmp $0,%rax # compare rax with 0
jne loop2 # jump if not equal
mov %rdx,%rax # else, move register rdx to rax

# 3. Multiplication
mov $5,%rdx
mov $-1,%rdx
add %rax,%rdx
loop3:
  mov %rdx,%rdi
  mul %rax
  mov %rdi,%rdx
  add $-1,%rdx
  cmp $0,%rdx
jne loop3

# 4. More sums
mov $20, %r8
mov $3, %r9
mov $5, %r10
mov $0, %r11
sum_loop:
  mov $0, %rdx
  mov $8, %rax
  idiv %r9
  cmp $0, %rdx
  je add_number

  mov $0, %rdx
  mov %r8, %rax
  idiv %r10
  cmp $0, %rdx
  jne end
add_number:
  add %r8, %r11
end:
  sub $1, %r8
  cmp $0, %r8
  jne sum_loop
mov %r11, %rax
call print_rax

# 5. GDB






  call print_rax          # to print the RAX register

  # Syscall calling sys_exit
  mov $60, %rax            # rax: int syscall number
  mov $0, %rdi             # rdi: int error code
  syscall


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
