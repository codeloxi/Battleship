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
	.ascii	"cls\000"
	.align	2
.LC1:
	.ascii	"Please enter the %d cells to place the %s across (w"
	.ascii	"ith no spaces): \000"
	.align	2
.LC2:
	.ascii	"%s\000"
	.align	2
.LC3:
	.ascii	"Please read parameters carefully - INVALID INPUT\000"
	.text
	.align	2
	.global	manually_place_ships
	.type	manually_place_ships, %function
manually_place_ships:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-28]
	sub	r3, fp, #24
	mov	r2, #0
	str	r2, [r3]
	add	r3, r3, #4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	add	r3, r3, #2
	mov	r2, #0
	strb	r2, [r3]
	add	r3, r3, #1
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, .L18
	ldr	r3, [r3]
	mov	r0, r3
	bl	fflush
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L15:
	ldr	r0, .L18+4
	bl	system
	ldr	r0, [fp, #-72]
	mov	r1, #1
	bl	print_game_board
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-76]
	add	r3, r2, r3
	ldrh	r3, [r3, #2]
	sxth	r1, r3
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-76]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r0, .L18+8
	mov	r2, r3
	bl	printf
	sub	r3, fp, #28
	ldr	r0, .L18+12
	mov	r1, r3
	bl	__isoc99_scanf
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-76]
	add	r3, r2, r3
	ldrh	r3, [r3, #2]
	sxth	r3, r3
	sub	r1, fp, #68
	sub	r2, fp, #28
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	string_to_pos
	mov	r3, r0
	cmp	r3, #0
	beq	.L3
	mov	r3, #1
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L4
.L11:
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r1, r3, r2
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-60]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #126
	bne	.L5
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r1, r3, r2
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-60]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r0, [fp, #-76]
	add	r3, r0, r3
	ldrb	r0, [r3]	@ zero_extendqisi2
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r2, r0
	strb	r2, [r3]
	b	.L16
.L5:
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r0, .L18+16
	bl	puts
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L7
	b	.L8
.L9:
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-64]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r1, r3, r2
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #3
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r2, [r3, #-60]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r2, #126
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L8:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L9
.L7:
	mov	r0, r0	@ nop
	b	.L12
.L16:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #3
	ldr	r2, [fp, #-76]
	add	r3, r2, r3
	ldrh	r3, [r3, #2]
	sxth	r2, r3
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bgt	.L11
	b	.L12
.L3:
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r0, .L18+16
	bl	puts
.L12:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L13
	b	.L17
.L13:
	b	.L15
.L17:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L15
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L19:
	.align	2
.L18:
	.word	stdin
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	manually_place_ships, .-manually_place_ships
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u1) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
