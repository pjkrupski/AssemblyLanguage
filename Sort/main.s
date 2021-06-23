.cpu cortex-a53
.fpu neon-fp-armv8

.data
inprompt: .asciz "Enter a number: "
userinput: .asciz "%d"

.text
.align 2
.global main
.type main, %function

main:
   push {fp, lr}
   add fp, sp, #4

   sub sp, sp, #20

   mov r4, #0

   loop1:
      cmp r4, #5
      bge done_loop1

      ldr r0, =inprompt
      bl printf

      sub sp, sp, #4
      mov r1, sp
      ldr r0, =userinput
      bl scanf

      ldr r5, [sp]
      add sp, sp, #4

      @ calculate memory offset
      mov r1, #4
      mul r1, r1, r4
      str r5, [sp, r1]

      add r4, r4, #1
      b loop1

   done_loop1:

      mov r0, sp
      mov r1, #5
      bl sort

      mov r0, sp
      mov r1, #5
      bl print_results

      sub sp, fp, #4
      pop {fp, pc}
