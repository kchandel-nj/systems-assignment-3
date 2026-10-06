# Write the assembly code for the main function of the mystery program
.text

.globl main
main:
  push %rbx
  push %r12
  sub $8, %rsp

  cmp $3, %edi
  je .ArgsOk

  # Not 2 args provided
  lea error_msg(%rip), %rdi
  xor %al, %al
  call printf

  mov $1, %rax
  jmp .End

.ArgsOk:
  # Continue
  mov %rsi, %rbx

  mov 8(%rbx), %rdi
  xor %esi, %esi
  mov $10, %edx
  call strtol
  mov %rax, %r12

  mov 16(%rbx), %rdi
  xor %esi, %esi
  mov $10, %edx
  call strtol

  mov %rax, %rsi
  mov %r12, %rdi
  call crunch

  test %rax, %rax
  js .Hat
  jz .Tea

  lea beer_msg(%rip), %rdi
  jmp .Print

.Hat:
  lea hat_msg(%rip), %rdi
  jmp .Print

.Tea:
  lea tea_msg(%rip), %rdi

.Print:
  xor %al, %al
  call printf

  mov $0, %rax

.End:
  add $8, %rsp
  pop %r12
  pop %rbx
  ret

.data
error_msg:
  .asciz "Two arguments required.\n"
hat_msg:
  .asciz "hat\n"
tea_msg:
  .asciz "tea\n"
beer_msg:
  .asciz "beer\n"
