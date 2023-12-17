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
	.text
	.align	2
	.global	update
	.type	update, %function
update:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	sub	r3, fp, #16
	stmia	r3, {r1, r2}
	ldr	r3, [fp, #-16]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r1, r3, r2
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #98
	cmp	r3, #28
	ldrls	pc, [pc, r3, asl #2]
	b	.L7
.L4:
	.word	.L3
	.word	.L3
	.word	.L3
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L3
	.word	.L7
	.word	.L3
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L5
.L5:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r1, r3, r2
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r2, #109
	strb	r2, [r3]
	b	.L1
.L3:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r1, r3, r2
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r2, #42
	strb	r2, [r3]
	b	.L1
.L7:
	mov	r0, r0	@ nop
.L1:
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	update, .-update
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u1) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
