.cpu cortex-a53
.fpu neon-fp-armv8

.data
putp: .asciz "%d\n"

.text
.align 2
.global print_results
.type print_results, %function

print_results:
   push {fp, lr}
   add fp, sp, #4

   mov r4, r0  @ array into r4
   mov r5, r1  @ 5 into r5

   mov r6, #0  @ r6 --> i counter

   loop2:
      cmp r6, r5  @ i < 5
      bge done_loop2
      mov r1, #4
      mul r1, r1, r6
      ldr r1, [r4, r1]
      ldr r0, =putp
      bl printf

      add r6, r6, #1
      b loop2

   done_loop2:
      sub sp, fp, #4
      pop {fp, pc}
