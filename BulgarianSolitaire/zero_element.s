@this function will be called in a loop by the main function each time
@a 0 is detected in the array. The function will shift the array values
@to overwrite the zero keeping 45 as the tital


.cpu cortex-a53
.fpu neon-fp-armv8

.data


.text
.align 2
.global zero_element
.type zero_element, %function


zero_element:
    push {fp, lr}
    add fp, sp, #4

    @ r0 <- address of the array
    @ r1 <- number of elements of array

    mov r5, r1

    mov r7, r0

    mov r9, r1
    mov r8, r1  @ use r8 as a temp index
    sub r8, r8, #1
    mov r3, r8       @for zero replacing
   

@memory offset, cuz zero is first element
@so if you dont subtract one it reaches too high. 
@ARRAYS are 0 based



   

	


    loop2:
        cmp r9, #0  @ while (r5 >= 0)
        ble doneloopTwo

        sub r9, r9, #1
       

 @calculate byte offset from r7
        mov r2, #4
        mul r2, r8, r2  @ bytes offset = 4*(index)

        sub r8, r8, #1

        ldr r1, [r7, r2]  @ r1 = r7[r2]
        cmp r1, #0
	bgt loop2

	mov r4, r2
	mov r2, #4
        mul r2, r3, r2
	ldr r1, [r7, r2]
	str r1, [r7, r4]
        sub r5, r5, #1
          

	

@reset values for next zero detect
	mov r8, r5
	mov r9, r5
	sub r8, r8, #1
	mov r3, r8

	b loop2

     doneloopTwo:

	mov r0, r5	

        sub sp, fp, #4
        pop {fp, pc}


