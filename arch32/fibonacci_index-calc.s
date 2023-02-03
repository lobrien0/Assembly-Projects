.global _start
_start:
	mov r0, #0					@moves value '0' into r0
	mov r1, #1					@moves value '1' into r1
	ldr r3, #fib_digit_count	@stores the fib-number in r3
	sub r3, r3, #1				@subtracts 1 from fib-num to balence

_loop:							@loops
	cmp r3, #0					@Checks if r3 is zero from fib-num decroments
	beq _end					@if r3 is zero, breaks the loop
	
	mov r2, r0					@moves r0 into r2 for temp storage
	mov r0, r1					@moves r1 into r0 as new value
	add r1, r2, r0				@adds r0 and r2 or the last two numbers in the sequence
	add r3, #-1					@Decroments 1 from r3 to keep count
	b _loop						@sends back to "_loop"
	
_end:
	b _end						@ends program by getting it stuck in loop
	
fib_digit_count: .word 47