.cpu cortex-a53
.fpu neon-fp-armv8


.data
outp: .asciz "Overflow occured at: %d\n"

.text
.align 2
.global overflowCheck
.type overflowCheck, %function

overflowCheck:

   push {fp, lr}
   add fp, sp, #4

   adds r0, r0, r1

   bcs overflow 
   
  
   
   sub sp, fp, #4
   pop {fp}
   pop {lr}
   bx lr



   overflow:
   mov r1, r4 
   ldr r0, =outp @should have sum of last two numbers
   bl printf
