.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global sort
.type sort, %function

sort:
   push {fp, lr}
   add fp, sp, #4

   mov r4, r0  @ store array into r4
   mov r5, r1  @ r5 = 5

   mov r0, #1  @ i = 1

   loopi:
      cmp r0, r5
      bge done_sort

      mov r1, r0  @ j = i

      loopj:
         cmp r1, r5
         bge done_loopj

         @ compute memory to compare a[i-1] vs. a[j]
         @ memory offset for i-1 -> r9
         @ memory offset for j -> r10

         mov r9, r0
         sub r9, r9, #1
         mov r8, #4
         mul r9, r9, r8
         ldr r2, [r4, r9]  @ r2 = a[i-1]

         mov r10, r1
         mov r8, #4
         mul r10, r10, r8
         ldr r3, [r4, r10]  @ r3 = a[j]

         cmp r2, r3
         ble skip
         str r2, [r4, r10]  @ a[i-1] --> a[j]
         str r3, [r4, r9]   @ a[j] --> a[i-1]

         skip:
            add r1, r1, #1  @ j = j+1
            b loopj

      done_loopj:
         add r0, r0, #1  @ i = i+1;
         b loopi

   done_sort:

      sub sp, fp, #4
      pop {fp, pc}
