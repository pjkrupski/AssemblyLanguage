.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global modulo
.type modulo, %function

modulo:

	@mov r4, lr if this wasnt commented out there'd be an infinite loop

	@n stored in r0
	@p stored in r1

	udiv r2, r0, r1 @r2 = n/p
	mul  r2, r2, r1 @r2 = (n/p)*p
	subs r2, r0, r2  @r2 = n-(n/p)*p

@opcode followed by an s if the result is negative it sets the negative flag to one
@ if the result is 0 it sets the flag to one 


@will need flag in lab three to check overflow


mov r0, r2 @return r2 back from the function
@mov lr, r4

bx lr
@make sure theres a blank line on the bottom
