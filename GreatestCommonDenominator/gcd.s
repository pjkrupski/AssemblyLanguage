.cpu cortex-a53
.fpu neon-fp-armv8

@define constants
.data
    input: .asciz "Enter the larger number for GCD: "
    inputSecond: .asciz "Enter the smaller number for GCD: "
    input2: .asciz "%d"
    input3: .asciz "%d"
    output: .asciz "The greatest common denominator is: %d\n"

@define the assembler cdoe

.text
.align 2
.global main            @define main as a global
.type main, %function   @define main as a function

@start of the code

main:

mov r4, lr

@get first num

ldr r0, =input
bl printf
ldr r0, =input2
sub sp, sp, #4
mov r1, sp
bl scanf 
ldr r5, [sp]
add sp, sp, #4



@get 2nd num

ldr r0, =inputSecond
bl printf
ldr r0, =input3
sub sp, sp, #4
mov r1, sp   @has to be r1
bl scanf 
ldr r6, [sp]
add sp, sp, #4



@Big num is in r5 and little num is in r6
@r7 will hold initial rem



@whileloop until rem = 0
whileloop:


@call mod function
mov r0, r5
mov r1, r6
bl modulo  @modulo(r0, r1)


@result from modulo is stored in r0
mov r7, r0

mov r5, r6
mov r8, r6
mov r6, r7


@last dicisor stored in r8



cmp r7, #0
bgt whileloop








@how to output the number 
ldr r0, =output
mov r1, r8
bl printf








mov lr, r4

mov r0, #0
mov pc, lr
@udiv r2, r0, r1 @r2 = n/p




