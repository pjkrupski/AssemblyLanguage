.cpu cortex-a53
.fpu neon-fp-armv8

.data
input: .asciz "Enter a number to get the factorial:"
input2: .asciz "%d"
outp: .asciz "The result is: %d\n"

.text
.align 2
.global main
.type main, %function


main: 

	push {fp, lr}
   	add fp, sp, #4



@reading in begin
    ldr r0, =input
    bl printf
    ldr r0, =input2

    sub sp, sp, #4
    mov r1, sp

    bl scanf
    ldr r2, [sp]
@reading in end


@let r1 be anwer
mov r1, #1
mov r4, #0

while:


   bl factorialoverflowCheck

   cmp r3, #0
   bgt end


@mul r1, r1, r2
mov r1, r0
sub r2, r2, #1 
add r4, #1



cmp r2, #1
bgt while





@printing out begin
    @mov r1, r2
    ldr r0, =outp
    bl printf
@printing out end


end:
mov r0, #0
mov r1, #0
mov r2, #0

@stuff to end program
   sub sp, fp, #4
   pop {fp}
   pop {lr}
   bx lr

    mov r0, #0

    bx lr
@stuff to end program
