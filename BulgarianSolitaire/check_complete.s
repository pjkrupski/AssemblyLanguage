@this function will be called by the main function each time the turn
@process has been completed inorder to determine if another turn is 
@needed before the game is over


.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp: .asciz "%d\n"

.text
.align 2
.global check_complete
.type check_complete, %function

check_complete:
    push {fp, lr}
    add fp, sp, #4





@this check will be completed using two different loops

@The first loop will iterate through the array and check 
@if the # of elements is =9. If false, 0 will be returned and the function
@will end. If the # of elements is =9 the second loop will
@execute iterating through the array again this time checking for 
@repeated elements, if a repeat is found a 0 will be returned and
@the function will end. If no repeats are found then a 1 is returned and
@the function will end



    @ r0 <- address of the array
    @ r1 <- number of elements of array

    mov r5, #0		       @ count elements
    mov r3, r1                 @ compare the size against r8
    mov r7, r0                 @ location of array 
    mov r8, r1                 @ control number of iterations
    

@memory offset, cuz zero is first element
@so if you dont subtract one it reaches too high. 
@ARRAYS are 0 based


    checkNum:
        cmp r8, #0              @ while (r5 >= 0)
        ble checkElemPre

        sub r8, r8, #1
        add r5, r5, #1


	b checkNum



    checkElemPre:
	cmp r5, #9
	bne fail
	mov r8, r3

    checkElem:
	cmp r8, #0             @ while (r5 >= 0)
        ble doneCheck

	sub r8, r8, #1

	mov r2, #4
        mul r2, r8, r2
	ldr r1, [r7, r2]
	cmp r1, #9
	bgt fail

	b checkElem




doneCheck:
	mov r0, #1
        sub sp, fp, #4
        pop {fp, pc}

fail:
	mov r0, #0
        sub sp, fp, #4
        pop {fp, pc}

