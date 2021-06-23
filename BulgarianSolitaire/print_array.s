@this function will be called throughout the program to print the array


.cpu cortex-a53
.fpu neon-fp-armv8

.data
outp: .asciz "%d\n"  


.text
str: .ascii "Next Turn \n" 

.align 2
.global print_array
.type print_array, %function

print_array:
    push {fp, lr}
    add fp, sp, #4

    @ r0 <- address of the array
    @ r1 <- number of elements of array

    mov r5, r1

    mov r7, r0

    mov r8, r1  @ use r8 as a temp index
    sub r8, r8, #1   

@memory offset, cuz zero is first element
@so if you dont subtract one it reaches too high. 
@ARRAYS are 0 based


    loop2:
        cmp r5, #0  @ while (r5 >= 0)
        ble doneloop2

        sub r5, r5, #1
       

 @calculate byte offset from r7
        mov r2, #4
        mul r2, r8, r2  @ bytes offset = 4*(index)

        sub r8, r8, #1

        ldr r1, [r7, r2]  @ r1 = r7[r2]
        ldr r0, =outp

        bl printf
     b loop2

     doneloop2:

	
	ldr r0, =str
	bl printf

        sub sp, fp, #4
        pop {fp, pc}
