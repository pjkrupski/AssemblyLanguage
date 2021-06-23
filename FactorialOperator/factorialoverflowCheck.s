.cpu cortex-a53
.fpu neon-fp-armv8

.data
outpp: .asciz "OVERFLOW OCCURED,on loop iteration %d\n"

.text
.align 2
.global factorialoverflowCheck
.type factorialoverflowCheck, %function

factorialoverflowCheck:

   push {fp, lr}
   add fp, sp, #4



   umull r0, r3, r1, r2

   cmp r3, #0
   bgt overflow 
   
  
   
   sub sp, fp, #4
   pop {fp}
   pop {lr}
   bx lr



   overflow:
   mov r1, r4 
   ldr r0, =outpp @should have sum of last two numbers
   bl printf



    mov r0, #0

    bx lr

