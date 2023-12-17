	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Player %d's Carrier sunked!\012\000"
	.align	2
.LC1:
	.ascii	"Player %d's Battleship sunked!\012\000"
	.align	2
.LC2:
	.ascii	"Player %d's Cruiser sunked!\012\000"
	.align	2
.LC3:
	.ascii	"Player %d's Submarine sunked!\012\000"
	.align	2
.LC4:
	.ascii	"Player %d's Destroyer sunked!\012\000"
	.text
	.align	2
	.global	check_sunk
	.type	check_sunk, %function
check_sunk:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, r1
	strh	r3, [fp, #-18]	@ movhi
	mov	r3, r2
	strb	r3, [fp, #-19]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	sub	r3, r3, #98
	cmp	r3, #17
	ldrls	pc, [pc, r3, asl #2]
	b	.L2
.L4:
	.word	.L3
	.word	.L5
	.word	.L6
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L7
	.word	.L2
	.word	.L8
.L5:
	ldrsh	r2, [fp, #-18]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldrh	r2, [r3]
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	uxth	r2, r2
	strh	r2, [r3]	@ movhi
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L9
	ldrsh	r3, [fp, #-18]
	add	r3, r3, #1
	ldr	r0, .L16
	mov	r1, r3
	bl	printf
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L9:
	b	.L2
.L3:
	ldrsh	r2, [fp, #-18]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldrh	r2, [r3, #2]
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	uxth	r2, r2
	strh	r2, [r3, #2]	@ movhi
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	bne	.L10
	ldrsh	r3, [fp, #-18]
	add	r3, r3, #1
	ldr	r0, .L16+4
	mov	r1, r3
	bl	printf
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L10:
	b	.L2
.L7:
	ldrsh	r2, [fp, #-18]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldrh	r2, [r3, #4]
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	uxth	r2, r2
	strh	r2, [r3, #4]	@ movhi
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	bne	.L11
	ldrsh	r3, [fp, #-18]
	add	r3, r3, #1
	ldr	r0, .L16+8
	mov	r1, r3
	bl	printf
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L11:
	b	.L2
.L8:
	ldrsh	r2, [fp, #-18]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldrh	r2, [r3, #6]
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	uxth	r2, r2
	strh	r2, [r3, #6]	@ movhi
	ldrh	r3, [r3, #6]
	cmp	r3, #0
	bne	.L12
	ldrsh	r3, [fp, #-18]
	add	r3, r3, #1
	ldr	r0, .L16+12
	mov	r1, r3
	bl	printf
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L12:
	b	.L2
.L6:
	ldrsh	r2, [fp, #-18]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldrh	r2, [r3, #8]
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	uxth	r2, r2
	strh	r2, [r3, #8]	@ movhi
	ldrh	r3, [r3, #8]
	cmp	r3, #0
	bne	.L13
	ldrsh	r3, [fp, #-18]
	add	r3, r3, #1
	ldr	r0, .L16+16
	mov	r1, r3
	bl	printf
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L15
.L13:
.L15:
	mov	r0, r0	@ nop
.L2:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L17:
	.align	2
.L16:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	check_sunk, .-check_sunk
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u1) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
