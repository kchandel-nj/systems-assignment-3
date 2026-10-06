# Write the assembly code for the array_max function

.text
.globl array_max
array_max:
  xor %eax, %eax
  xor %ecx, %ecx

.Loop:
  cmp %rdi, %rcx
  jae .Done

  mov (%rsi,%rcx,8), %rdx
  cmp %rax, %rdx
  jbe .Next
  mov %rdx, %rax

.Next:
  inc %rcx
  jmp .Loop

.Done:
  ret