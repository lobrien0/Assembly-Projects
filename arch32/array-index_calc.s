.global _start
_start:
	
	ldr r0, =arrStart	@sets r0 to location of array
	ldr r1, rowIndex	@sets r1 to wanted row
	ldr r2, colIndex	@sets r2 to wanted col
	ldr r3, numCols		@sets r3 to total # of col
	
	bl getArrVal		@branches to getArrVal subroutine, Storing answer in r0
	push {r0}			@pushes answer to stack for "future" use
	b endProgram		@ends program
	
getArrVal:
					@Simplified formual: (=arr)+(.word)*(r1*r3+r2)
	mul r1, r1, r3		@r1 = r1 * r3
	add r1, r1, r2		@r1 = (r1*r3) + r2
	mov r2, #4			@r2 = 4 (or .word size)
	mul r1, r1, r2		@r1 = ((r1*3)+r2) * 4
	ldr r0, [r0, +r1]	@r1 = (=arr) + (((r1*3)+r2) * 4)
	
	bx lr				@link back to before this subroutine
	
endProgram:
	b endProgram

@data - For what ever reason when this line was .data it didn't compile
arrStart:		.word 11, 12, 13, 14, 15, 21, 22, 23, 24, 25, 31, 32, 33, 34, 35, 41, 42, 43, 44, 45, 51, 52, 53, 54,55
rowIndex:		.word 4
colIndex:		.word 4
numCols:		.word 5
						@Convention is Row x Col in arr
						@	11,12,13,14,15
						@	21,22,23,24,25
						@	31,32,33,34,35				r0 Should be 
						@	41,42,43,44,45				   or 0x37
						@	51,52,53,54,55