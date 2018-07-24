	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"Pred_SP.c"
	.text
	.align	2
	.global	cordic
	.type	cordic, %function
cordic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	cmp	r1, #16
	movlt	r8, r1
	movge	r8, #16
	cmp	r8, #0
	movle	r3, #9920
	ldr	sl, .L8
	addle	r3, r3, #29
	movle	r1, #0
	ldr	r2, [sl, #0]
	mov	ip, r0, asr #15
	movle	r2, r1
	movle	r0, r3
	ble	.L3
	mov	r4, #0
	mov	r5, #9920
	mov	r7, r0
	add	r5, r5, #29
	mov	r6, r4
.L5:
	eor	r1, ip, r5, asr r4
	eor	r0, ip, r6, asr r4
	eor	r3, r2, ip
	rsb	r3, r3, ip
	add	r2, r4, #1
	add	r3, r3, r7
	rsb	r1, ip, r1
	rsb	r0, r0, ip
	cmp	r8, r2
	mov	r4, r2
	add	r6, r1, r6
	add	r5, r0, r5
	mov	r7, r3
	ldr	r2, [sl, r2, asl #2]
	mov	ip, r3, asr #15
	bgt	.L5
	mov	r0, r5, asr r8
	mov	r2, r6, asr r8
	mov	r3, r5
	mov	r1, r6
.L3:
	eor	r0, ip, r0
	rsb	r0, ip, r0
	add	r3, r3, ip
	eor	r2, ip, r2
	rsb	r3, r2, r3
	add	r0, r0, r1
	orr	r0, r0, r3, asl #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	cordic, .-cordic
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	fstmfdd	sp!, {d8, d9, d10, d11}
	mov	r3, #4980736
	add	r3, r3, #19200
	sub	sp, sp, #20
	add	r3, r3, #64
	str	r3, [sp, #8]
	bl	clock
	mov	fp, #9920
	fldd	d8, .L14
	fldd	d9, .L14+8
	fldd	d10, .L14+16
	fldd	d11, .L14+24
	ldr	sl, .L14+32
	str	r0, [sp, #12]
	add	fp, fp, #29
	mov	r9, #0
.L11:
	fmsr	s15, r9	@ int
	fsitod	d16, s15
	fmuld	d17, d16, d8
	fmuld	d18, d17, d9
	fmuld	d16, d18, d10
	ftosizd	s15, d16
	fmrs	r5, s15	@ int
	ldr	r3, [sl, #0]
	mov	ip, r5, asr #15
	eor	r3, ip, r3
	add	r5, ip, r5
	rsb	r5, r3, r5
	ldr	r2, [sl, #4]
	mov	lr, r5, asr #15
	eor	r2, lr, r2
	add	r5, lr, r5
	rsb	r5, r2, r5
	ldr	r3, [sl, #8]
	mov	r0, r5, asr #15
	eor	r3, r0, r3
	add	r5, r0, r5
	rsb	r5, r3, r5
	ldr	r2, [sl, #12]
	mov	r7, r5, asr #15
	eor	r2, r7, r2
	add	r5, r7, r5
	eor	r1, ip, fp
	mov	r4, #9920
	rsb	r1, ip, r1
	rsb	r5, r2, r5
	add	r4, r4, #29
	ldr	ip, [sl, #16]
	mov	r6, r5, asr #15
	eor	r3, lr, r1, asr #1
	eor	r2, lr, r4, lsr #1
	add	r4, lr, r4
	rsb	r4, r3, r4
	rsb	r2, lr, r2
	eor	ip, r6, ip
	add	r5, r6, r5
	add	r1, r1, r2
	eor	lr, r0, r4, asr #2
	rsb	r5, ip, r5
	ldr	r3, [sl, #20]
	mov	ip, r5, asr #15
	rsb	lr, r0, lr
	add	r4, r0, r4
	eor	r0, r0, r1, asr #2
	add	lr, lr, r1
	eor	r3, ip, r3
	rsb	r4, r0, r4
	add	r5, ip, r5
	rsb	r5, r3, r5
	eor	r0, r7, r4, asr #3
	eor	r3, r7, lr, asr #3
	add	r4, r7, r4
	ldr	r2, [sl, #24]
	mov	r1, r5, asr #15
	rsb	r4, r3, r4
	rsb	r0, r7, r0
	add	r0, r0, lr
	eor	r7, r6, r4, asr #4
	eor	r2, r1, r2
	add	r5, r1, r5
	rsb	r5, r2, r5
	rsb	r7, r6, r7
	add	r4, r6, r4
	ldr	r2, [sl, #28]
	eor	r6, r6, r0, asr #4
	mov	lr, r5, asr #15
	add	r7, r7, r0
	rsb	r4, r6, r4
	eor	r3, ip, r7, asr #5
	eor	r0, ip, r4, asr #5
	eor	r2, lr, r2
	add	r5, lr, r5
	add	r4, ip, r4
	rsb	r4, r3, r4
	rsb	r5, r2, r5
	rsb	r0, ip, r0
	ldr	r3, [sl, #32]
	mov	r2, r5, asr #15
	add	r0, r0, r7
	eor	ip, r1, r4, asr #6
	eor	r3, r2, r3
	rsb	ip, r1, ip
	add	r5, r2, r5
	add	r4, r1, r4
	eor	r1, r1, r0, asr #6
	add	ip, ip, r0
	rsb	r4, r1, r4
	rsb	r5, r3, r5
	ldr	r1, [sl, #36]
	mov	r6, r5, asr #15
	eor	r3, lr, ip, asr #7
	eor	r0, lr, r4, asr #7
	add	r4, lr, r4
	rsb	r4, r3, r4
	eor	r1, r6, r1
	rsb	r0, lr, r0
	add	r5, r6, r5
	add	r0, r0, ip
	rsb	r5, r1, r5
	eor	ip, r2, r4, asr #8
	ldr	r1, [sl, #40]
	mov	r3, r5, asr #15
	rsb	ip, r2, ip
	add	r4, r2, r4
	eor	r2, r2, r0, asr #8
	add	ip, ip, r0
	rsb	r4, r2, r4
	eor	r1, r3, r1
	add	r5, r3, r5
	eor	r2, r6, ip, asr #9
	rsb	r5, r1, r5
	eor	r0, r6, r4, asr #9
	ldr	r1, [sl, #44]
	add	r4, r6, r4
	mov	lr, r5, asr #15
	rsb	r4, r2, r4
	rsb	r0, r6, r0
	add	r0, r0, ip
	eor	r6, r3, r4, asr #10
	eor	r1, lr, r1
	add	r5, lr, r5
	rsb	r5, r1, r5
	rsb	r6, r3, r6
	add	r4, r3, r4
	ldr	r1, [sl, #48]
	eor	r3, r3, r0, asr #10
	mov	r2, r5, asr #15
	add	r6, r6, r0
	rsb	r4, r3, r4
	eor	r0, lr, r4, asr #11
	eor	r3, lr, r6, asr #11
	eor	r1, r2, r1
	add	r5, r2, r5
	add	r4, lr, r4
	rsb	r4, r3, r4
	rsb	r5, r1, r5
	rsb	r0, lr, r0
	ldr	r3, [sl, #52]
	mov	r1, r5, asr #15
	add	r0, r0, r6
	eor	lr, r2, r4, asr #12
	eor	r3, r1, r3
	rsb	lr, r2, lr
	add	r5, r1, r5
	add	r4, r2, r4
	eor	r2, r2, r0, asr #12
	add	lr, lr, r0
	rsb	r4, r2, r4
	rsb	r5, r3, r5
	ldr	ip, [sl, #56]
	eor	r3, r1, lr, asr #13
	mov	r2, r5, asr #15
	eor	r0, r1, r4, asr #13
	add	r4, r1, r4
	eor	ip, r2, ip
	rsb	r4, r3, r4
	rsb	r0, r1, r0
	add	r5, r2, r5
	add	r0, r0, lr
	rsb	r5, ip, r5
	eor	r7, r2, r4, asr #14
	ldr	r3, [sl, #60]
	mov	r1, r5, asr #15
	rsb	r7, r2, r7
	add	r4, r2, r4
	eor	r2, r2, r0, asr #14
	rsb	r4, r2, r4
	add	r7, r7, r0
	eor	r3, r1, r3
	add	r5, r5, r1
	eor	r6, r1, r4, asr #15
	rsb	r5, r3, r5
	add	r4, r4, r1
	eor	r3, r1, r7, asr #15
	rsb	r4, r3, r4
	mov	r5, r5, asr #15
	rsb	r6, r1, r6
	eor	r4, r5, r4, asr #16
	rsb	r4, r5, r4
	add	r6, r6, r7
	add	r6, r6, r4
	mov	r6, r6, asl #16
	fmrrd	r0, r1, d18
	mov	r6, r6, asr #16
	bl	sin
	fmsr	s15, r6	@ int
	fsitod	d16, s15
	fmuld	d17, d16, d11
	stmia	sp, {r0-r1}
	fmrrd	r2, r3, d17
	ldr	r0, .L14+36
	bl	printf
	add	r3, r9, #1
	fmsr	s15, r3	@ int
	fsitod	d16, s15
	fmuld	d17, d16, d8
	fmuld	d18, d17, d9
	fmuld	d16, d18, d10
	ftosizd	s15, d16
	fmrs	r5, s15	@ int
	ldr	r3, [sl, #0]
	mov	ip, r5, asr #15
	eor	r3, ip, r3
	add	r5, ip, r5
	rsb	r5, r3, r5
	ldr	r2, [sl, #4]
	mov	r6, r5, asr #15
	eor	r2, r6, r2
	add	r5, r6, r5
	rsb	r5, r2, r5
	ldr	r3, [sl, #8]
	mov	r0, r5, asr #15
	eor	r3, r0, r3
	add	r5, r0, r5
	rsb	r5, r3, r5
	ldr	r2, [sl, #12]
	mov	r8, r5, asr #15
	eor	r2, r8, r2
	add	r5, r8, r5
	eor	r1, ip, fp
	mov	r4, #9920
	rsb	r1, ip, r1
	rsb	r5, r2, r5
	add	r4, r4, #29
	ldr	ip, [sl, #16]
	mov	r7, r5, asr #15
	eor	r3, r6, r1, asr #1
	eor	r2, r6, r4, lsr #1
	add	r4, r6, r4
	rsb	r4, r3, r4
	rsb	r2, r6, r2
	eor	ip, r7, ip
	add	r5, r7, r5
	add	r1, r1, r2
	eor	r6, r0, r4, asr #2
	rsb	r5, ip, r5
	ldr	r3, [sl, #20]
	b	.L15
.L16:
	.align	3
.L14:
	.word	-1698910392
	.word	1049286642
	.word	1413754136
	.word	1073291771
	.word	0
	.word	1087373312
	.word	0
	.word	1058013184
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
.L15:
	mov	ip, r5, asr #15
	rsb	r6, r0, r6
	add	r4, r0, r4
	eor	r0, r0, r1, asr #2
	add	r6, r6, r1
	eor	r3, ip, r3
	rsb	r4, r0, r4
	add	r5, ip, r5
	rsb	r5, r3, r5
	eor	r0, r8, r4, asr #3
	eor	r3, r8, r6, asr #3
	add	r4, r8, r4
	ldr	r2, [sl, #24]
	mov	r1, r5, asr #15
	rsb	r4, r3, r4
	rsb	r0, r8, r0
	add	r0, r0, r6
	eor	r8, r7, r4, asr #4
	eor	r2, r1, r2
	add	r5, r1, r5
	rsb	r5, r2, r5
	rsb	r8, r7, r8
	add	r4, r7, r4
	ldr	r2, [sl, #28]
	eor	r7, r7, r0, asr #4
	mov	r6, r5, asr #15
	rsb	r4, r7, r4
	add	r8, r8, r0
	eor	r2, r6, r2
	eor	r0, ip, r4, asr #5
	eor	r3, ip, r8, asr #5
	add	r5, r6, r5
	add	r4, ip, r4
	rsb	r4, r3, r4
	rsb	r5, r2, r5
	rsb	r0, ip, r0
	ldr	r3, [sl, #32]
	mov	r2, r5, asr #15
	add	r0, r0, r8
	eor	ip, r1, r4, asr #6
	eor	r3, r2, r3
	rsb	ip, r1, ip
	add	r5, r2, r5
	add	r4, r1, r4
	eor	r1, r1, r0, asr #6
	add	ip, ip, r0
	rsb	r4, r1, r4
	rsb	r5, r3, r5
	ldr	r1, [sl, #36]
	mov	r7, r5, asr #15
	eor	r3, r6, ip, asr #7
	eor	r0, r6, r4, asr #7
	add	r4, r6, r4
	rsb	r4, r3, r4
	eor	r1, r7, r1
	rsb	r0, r6, r0
	add	r5, r7, r5
	add	r0, r0, ip
	rsb	r5, r1, r5
	eor	ip, r2, r4, asr #8
	ldr	r1, [sl, #40]
	mov	r3, r5, asr #15
	rsb	ip, r2, ip
	add	r4, r2, r4
	eor	r2, r2, r0, asr #8
	add	ip, ip, r0
	rsb	r4, r2, r4
	eor	r1, r3, r1
	add	r5, r3, r5
	eor	r2, r7, ip, asr #9
	rsb	r5, r1, r5
	eor	r0, r7, r4, asr #9
	ldr	r1, [sl, #44]
	add	r4, r7, r4
	mov	r6, r5, asr #15
	rsb	r4, r2, r4
	rsb	r0, r7, r0
	add	r0, r0, ip
	eor	r7, r3, r4, asr #10
	eor	r1, r6, r1
	add	r5, r6, r5
	rsb	r5, r1, r5
	rsb	r7, r3, r7
	add	r4, r3, r4
	ldr	r1, [sl, #48]
	eor	r3, r3, r0, asr #10
	mov	r2, r5, asr #15
	add	r7, r7, r0
	rsb	r4, r3, r4
	eor	r0, r6, r4, asr #11
	eor	r3, r6, r7, asr #11
	eor	r1, r2, r1
	add	r5, r2, r5
	add	r4, r6, r4
	rsb	r4, r3, r4
	rsb	r5, r1, r5
	rsb	r0, r6, r0
	ldr	r3, [sl, #52]
	mov	r1, r5, asr #15
	add	r0, r0, r7
	eor	r6, r2, r4, asr #12
	eor	r3, r1, r3
	rsb	r6, r2, r6
	add	r5, r1, r5
	add	r4, r2, r4
	eor	r2, r2, r0, asr #12
	add	r6, r6, r0
	rsb	r4, r2, r4
	rsb	r5, r3, r5
	ldr	ip, [sl, #56]
	mov	r2, r5, asr #15
	eor	r3, r1, r6, asr #13
	eor	r0, r1, r4, asr #13
	add	r4, r1, r4
	eor	ip, r2, ip
	rsb	r4, r3, r4
	rsb	r0, r1, r0
	add	r5, r2, r5
	add	r0, r0, r6
	rsb	r5, ip, r5
	eor	r7, r2, r4, asr #14
	ldr	r3, [sl, #60]
	mov	r1, r5, asr #15
	rsb	r7, r2, r7
	add	r4, r2, r4
	eor	r2, r2, r0, asr #14
	rsb	r4, r2, r4
	add	r7, r7, r0
	eor	r3, r1, r3
	add	r5, r5, r1
	eor	r6, r1, r4, asr #15
	rsb	r5, r3, r5
	add	r4, r4, r1
	eor	r3, r1, r7, asr #15
	rsb	r4, r3, r4
	mov	r5, r5, asr #15
	rsb	r6, r1, r6
	eor	r4, r5, r4, asr #16
	add	r6, r6, r7
	rsb	r4, r5, r4
	add	r6, r6, r4
	mov	r6, r6, asl #16
	fmrrd	r0, r1, d18
	mov	r6, r6, asr #16
	bl	sin
	fmsr	s15, r6	@ int
	fsitod	d16, s15
	fmuld	d17, d16, d11
	stmia	sp, {r0-r1}
	fmrrd	r2, r3, d17
	ldr	r0, .L14+36
	bl	printf
	ldr	r3, [sp, #8]
	add	r9, r9, #2
	cmp	r9, r3
	bne	.L11
	bl	clock
	ldr	r3, [sp, #12]
	rsb	r0, r3, r0
	fmsr	s15, r0	@ int
	fsitod	d16, s15
	ldr	r0, .L14+40
	fmrrd	r2, r3, d16
	bl	printf
	add	sp, sp, #20
	fldmfdd	sp!, {d8, d9, d10, d11}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	main, .-main
	.global	cordic_ctab
	.data
	.align	3
.LANCHOR0 = . + 0
	.type	cordic_ctab, %object
	.size	cordic_ctab, 64
cordic_ctab:
	.word	12867
	.word	7596
	.word	4013
	.word	2037
	.word	1022
	.word	511
	.word	255
	.word	127
	.word	63
	.word	31
	.word	15
	.word	7
	.word	3
	.word	1
	.word	0
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%f : %f\012\000"
	.space	3
.LC1:
	.ascii	"we need %f to complete.\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
