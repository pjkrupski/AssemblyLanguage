@this function will generate the initial hand of cards

.cpu cortex-a53
.fpu neon-fp-armv8

.data

outp: .asciz "Theres a deck of %d\n"
outP: .asciz "Done %d\n"

.text
.align 2
.global deal_cards
.type deal_cards, %function

deal_cards:

   push {fp, lr}
   add fp, sp, #4
  

@location of the top of the array is in r0
@save it to r2

   mov r7, r0
  

@randomize seed
@srand (time (0) )


@randomize the seed
   mov r0, #0
   bl time 

@reslut --> r0
@r0, already has the seed value


   bl srand
   mov r4, #45     @r4 contains initial # of cards
   mov r5, #0      @count how many elements 



@gonna loop through generating random numbers,
@each random number gets subtracted from the initial 
@value and then pushed onto the stack
@r5 will be used as iteration counter AND byte offset calculator


loop1:      @while loop

   cmp r4, #0
   ble outloop1

   @random(1, r4)
   mov r0, #1
   mov r1, r4
   bl random
   @random # gets stored into r0
 
   @you cant send #0 to random because it breaks the %

   mov r3, #4
   mul r3, r3, r5
   str r0, [r7, r3]
  
   add r5, r5, #1   @increase number of array elements by 1

   sub r4, r4, r0

@Print numbers

   @mov r1, r5
   mov r1, r0
   ldr r0, =outp
   bl printf




   b loop1

outloop1:

   ldr r0, =outP
   bl printf


   mov r0, r5 @returns number of elements in array
   sub sp, fp, #4
   pop {fp, pc}



































