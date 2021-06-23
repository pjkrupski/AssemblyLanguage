.cpu cortex-a53
.fpu neon-fp-armv8

.data
input: .asciz "Enter the desired fibonacci sequence element:"
input2: .asciz "%d"
outp: .asciz "The result is: %d\n"


.text
.align 2
.global main
.type main, %function

main: 

mov r4, lr


@get input

mov r4, lr @ save lr into a safe location

    @print prompt asking for input
    @first, load input string into r0
    ldr r0, =input
    bl printf @call printf with arg in r0

    @get user input using scanf
    @scanf("%d", &n)
    ldr r0, =input2 @load first arg into r0
    @user input written to the top of the stack
    @move stack pointer up one memory location
    @on the stack, moving up memory = subtract 4 bytes
    sub sp, sp, #4
    mov r1, sp @second argument of scanf needs to be in r1


    bl scanf @scanf(=input2, sp)

    @once scanf is done, the input value is stored at sp
    @get the value in sp into r5
    ldr r7, [sp] @r7 = *sp (dereference sp)








@t1 = r5 t2 = r6 nextTerm = r8 number of iterations = r7

@initialize variables

mov r5, #1
mov r6, #1
mov r8, #0



whileloop:


mov r5, r6 @set t1 = t2
mov r6, r8 @set t2 = nextTerm
add r8, r5, r6  @ nextTerm = t1+t2

sub r7, r7, #1 @decrement counter

cmp r7, #0
bgt whileloop


mov r1, r8
ldr r0, =outp

bl printf

mov lr, r4

mov r0, #0

bx lr


















