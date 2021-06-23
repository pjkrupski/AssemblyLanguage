.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global gen_piles
.type gen_piles, %function

gen_piles:

   push {fp, lr}
   add fp, sp, #4


@we added 2 to r0 because of this gap


@original sp is in r0


@randomize seed
@srand (time (0) )


@randomize the seed
   mov ro, #0
   bl time @reslut --> r0
   @r0, already has the seed value
   bl srand



   mov r4, #60  @r4 contains initial # of cards

   mov r5, #0 @count how many elements 



@gonna loop through generating random numbers,
@each random number gets subtracted from the initial 
@value and then pushed onto the stack



loop1:   @while loop

   cmp r4, #0
   ble outloop1

   @random(1, r4)
   add r5, r5, #1   @increase number of array elements by 1
   mov r0, #1
   mov r1, r4
   bl random
   @random # gets stored into r0
  
   push {r0}
   sub r4, r4, r0
   b loop1

outloop1:
   mov r0, r5 @returns number of elements in array
   sub sp, fp, #4
   pop {fp, pc}



































