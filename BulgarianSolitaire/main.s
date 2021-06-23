.cpu cortex-a53
.fpu neon-fp-armv8

.data
elementNum: .asciz "%d\n"
endTurn: .asciz "GAMEOVER \n"

.text
.align 2
.global main
.type main, %function

main:


   push {fp, lr}
   add fp, sp, #4
   @ allocat a[45]
   sub sp, sp, #184

@temp location of array and permenant location of array 
   mov r0, sp
   mov r10, sp
 
  
   bl deal_cards @deal_cards(arrayLocation)





@returns number of elements in array (stored in r0)


@store # of elements in array into r6 IE # of piles

   mov r6, r0   
  






   mov r0, r10     @location
   mov r1, r6      @size


@r0 is memory location where array starts
@r1 is size of array
@when you pass an array to a function youre actually passing the memory address for the first index location
@assuming the byte offset worked we will now pass the array and arraysize to print_array



   bl print_array
   

start:
	@ldr r0, =startTurn
	@bl printf


 


@r10 is location of array
@r6 number of elements 

    mov r5, #0
    mov r8, r6  @ use r8 as a temp index


    
    

  

subOne:

        cmp r5, r6  
        bge endSub

        add r5, r5, #1
        sub r8, r8, #1

 
        mov r2, #4
        mul r2, r8, r2  

        

        ldr r1, [r10, r2] 
	sub r1, r1, #1
	str r1, [r10, r2]
	    


   b subOne
 




endSub:

   mov r2, #4
   mul r2, r2, r6   
   str r5, [r10, r2]
   add r6, r6, #1         @size of array is updated by 1



   mov r0, r10    @location of array
   mov r1, r6    @size of array
 
   bl print_array

  

   mov r0, r10    @location of array
   mov r1, r6    @size of array


   bl zero_element 



   mov r6, r0
   mov r0, r10    @location of array
   mov r1, r6    @size of array
 
   bl print_array
   

@check 9 piles
  cmp r6, #9
  bne start

@if it passes that, now check all elements are <= 9

  

   mov r5, r6     @size for loop
   mov r8, r6     @size for offset
   sub r8, r8, #1  

lastloopouter:

    cmp r5, #0  
    ble win  @blt not ble? 

    sub r5, r5, #1  @possibly move?

    mov r2, #4
    mul r2, r8, r2  @ bytes offset = 4*(index)

    sub r8, r8, #1

    ldr r1, [r10, r2] 
 
    cmp r1, #9
    bgt start
   
@check for duplicate with inner loop

    mov r3, r5
    mov r4, r5
    sub r4, r4, #1
lastloopinner:

   cmp r3, #0
   ble lastloopouter
   sub r3, r3, #1
    
   mov r2, #4
   mul r2, r4, r2

   sub r4, r4, #1

   ldr r9, [r10, r2]
   cmp r9, r1
   beq start

    b lastloopinner



win:

   
   ldr r0, =endTurn
   bl printf

   sub sp, fp, #4
   pop {fp, pc}
   bx lr

