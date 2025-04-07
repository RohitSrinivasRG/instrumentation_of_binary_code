	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"kiss_fft.c"
	.text
	.section	.my_kiss_fft_section,"ax",%progbits
	.align	2
	.global	kiss_fft_alloc
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kiss_fft_alloc, %function
kiss_fft_alloc:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	add	r3, r3, #33
	lsl	r3, r3, #3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L2
	ldr	r0, [fp, #-24]
	bl	malloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L3
.L2:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L4
	ldr	r3, [fp, #-52]
	ldr	r3, [r3]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bhi	.L4
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-32]
.L4:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-24]
	str	r2, [r3]
.L3:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L5
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	str	r2, [r3]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	str	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L6
.L8:
	movw	r2, #11544
	movt	r2, 21572
	movw	r3, #8699
	movt	r3, 16393
	strd	r2, [fp, #-12]
	vldr.64	d7, [fp, #-12]
	vmov.f64	d6, #-2.0e+0
	vmul.f64	d6, d7, d6
	ldr	r3, [fp, #-28]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vmul.f64	d5, d6, d7
	ldr	r3, [fp, #-40]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d5, d6
	vstr.64	d7, [fp, #-20]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L7
	vldr.64	d7, [fp, #-20]
	vneg.f64	d7, d7
	vstr.64	d7, [fp, #-20]
.L7:
	vldr.64	d0, [fp, #-20]
	bl	cos(PLT)
	vmov.f64	d7, d0
	ldr	r3, [fp, #-32]
	add	r2, r3, #264
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	add	r3, r2, r3
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [r3]
	vldr.64	d0, [fp, #-20]
	bl	sin(PLT)
	vmov.f64	d7, d0
	ldr	r3, [fp, #-32]
	add	r2, r3, #264
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	add	r3, r2, r3
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L6:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L8
	ldr	r3, [fp, #-32]
	add	r3, r3, #8
	mov	r1, r3
	ldr	r0, [fp, #-40]
	bl	kf_factor(PLT)
.L5:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.align	2
	.global	kiss_fft
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kiss_fft, %function
kiss_fft:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	mov	r3, #1
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	kiss_fft_stride(PLT)
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	kiss_fft, .-kiss_fft
	.align	2
	.global	kiss_fft_stride
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kiss_fft_stride, %function
kiss_fft_stride:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L12
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	lsl	r3, r3, #3
	mov	r0, r3
	bl	malloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	ldr	r2, [fp, #-16]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [fp, #-28]
	mov	r2, #1
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-8]
	bl	kf_work(PLT)
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	memcpy(PLT)
	ldr	r0, [fp, #-8]
	bl	free(PLT)
	b	.L14
.L12:
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	ldr	r2, [fp, #-16]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [fp, #-28]
	mov	r2, #1
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-24]
	bl	kf_work(PLT)
.L14:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	kiss_fft_stride, .-kiss_fft_stride
	.align	2
	.global	kiss_fft_cleanup
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kiss_fft_cleanup, %function
kiss_fft_cleanup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	kiss_fft_cleanup, .-kiss_fft_cleanup
	.align	2
	.global	kiss_fft_next_fast_size
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kiss_fft_next_fast_size, %function
kiss_fft_next_fast_size:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
.L25:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L17
.L18:
	ldr	r3, [fp, #-8]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L18
	b	.L19
.L20:
	ldr	r2, [fp, #-8]
	movw	r3, #21846
	movt	r3, 21845
	smull	r3, r1, r3, r2
	asr	r3, r2, #31
	sub	r3, r1, r3
	str	r3, [fp, #-8]
.L19:
	ldr	r1, [fp, #-8]
	movw	r3, #21846
	movt	r3, 21845
	smull	r3, r2, r3, r1
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	sub	r2, r1, r3
	cmp	r2, #0
	beq	.L20
	b	.L21
.L22:
	ldr	r2, [fp, #-8]
	movw	r3, #26215
	movt	r3, 26214
	smull	r1, r3, r3, r2
	asr	r1, r3, #1
	asr	r3, r2, #31
	sub	r3, r1, r3
	str	r3, [fp, #-8]
.L21:
	ldr	r1, [fp, #-8]
	movw	r3, #26215
	movt	r3, 26214
	smull	r2, r3, r3, r1
	asr	r2, r3, #1
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	cmp	r2, #0
	beq	.L22
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	ble	.L28
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L25
.L28:
	nop
	ldr	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kf_bfly2, %function
kf_bfly2:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	add	r3, r3, #264
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
.L30:
	ldr	r3, [fp, #-20]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-16]
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-20]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-16]
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-12]
	ldr	r3, [fp, #-20]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-16]
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-20]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-16]
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-8]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-12]
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-20]
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-24]
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-8]
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-20]
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-24]
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-12]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-24]
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-24]
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-8]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-24]
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L30
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	kf_bfly2, .-kf_bfly2
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kf_bfly4, %function
kf_bfly4:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #96
	str	r0, [fp, #-88]
	str	r1, [fp, #-92]
	str	r2, [fp, #-96]
	str	r3, [fp, #-100]
	ldr	r2, .L36
.LPIC0:
	add	r2, pc, r2
	ldr	r3, .L36+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	mov	r3,#0
	ldr	r3, [fp, #-100]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #1
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-100]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-96]
	add	r3, r3, #264
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-72]
.L34:
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-80]
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-80]
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-56]
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-80]
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-80]
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-52]
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-76]
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-76]
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-48]
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-76]
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-76]
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-44]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-72]
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-72]
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-40]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-72]
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-72]
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-36]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-48]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-16]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-44]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-12]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-48]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-88]
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-44]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-88]
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-56]
	vldr.32	s15, [fp, #-40]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-32]
	vldr.32	s14, [fp, #-52]
	vldr.32	s15, [fp, #-36]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-28]
	vldr.32	s14, [fp, #-56]
	vldr.32	s15, [fp, #-40]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-24]
	vldr.32	s14, [fp, #-52]
	vldr.32	s15, [fp, #-36]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-32]
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-28]
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-76]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-92]
	mov	r2, #24
	mul	r3, r2, r3
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-32]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-88]
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-88]
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-28]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-88]
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L32
	vldr.32	s14, [fp, #-16]
	vldr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-12]
	vldr.32	s15, [fp, #-24]
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-16]
	vldr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-12]
	vldr.32	s15, [fp, #-24]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
	b	.L33
.L32:
	vldr.32	s14, [fp, #-16]
	vldr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-12]
	vldr.32	s15, [fp, #-24]
	ldr	r3, [fp, #-100]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-16]
	vldr.32	s15, [fp, #-20]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-12]
	vldr.32	s15, [fp, #-24]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
.L33:
	ldr	r3, [fp, #-88]
	add	r3, r3, #8
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-68]
	sub	r3, r3, #1
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bne	.L34
	nop
	ldr	r2, .L36+8
.LPIC1:
	add	r2, pc, r2
	ldr	r3, .L36+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L35
	bl	__stack_chk_fail(PLT)
.L35:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L37:
	.align	2
.L36:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+8)
	.size	kf_bfly4, .-kf_bfly4
	.text
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kf_bfly3, %function
kf_bfly3:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #88
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	ldr	r2, .L41
.LPIC2:
	add	r2, pc, r2
	ldr	r3, .L41+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	mov	r3,#0
	ldr	r3, [fp, #-92]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #1
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-84]
	ldr	r2, [fp, #-92]
	mul	r3, r2, r3
	ldr	r1, [fp, #-88]
	add	r3, r3, #33
	sub	r2, fp, #56
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	ldr	r3, [fp, #-88]
	add	r3, r3, #264
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-68]
.L39:
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-68]
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-68]
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-40]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-68]
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-68]
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-36]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-64]
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-64]
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-32]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-64]
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-64]
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-28]
	vldr.32	s14, [fp, #-40]
	vldr.32	s15, [fp, #-32]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-24]
	vldr.32	s14, [fp, #-36]
	vldr.32	s15, [fp, #-28]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-20]
	vldr.32	s14, [fp, #-40]
	vldr.32	s15, [fp, #-32]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-48]
	vldr.32	s14, [fp, #-36]
	vldr.32	s15, [fp, #-28]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-44]
	ldr	r3, [fp, #-84]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-68]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-84]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-64]
	add	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-80]
	vldr.32	s15, [r3]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-24]
	vcvt.f64.f32	d7, s15
	vmov.f64	d5, #5.0e-1
	vmul.f64	d7, d7, d5
	vsub.f64	d7, d6, d7
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-80]
	vldr.32	s15, [r3, #4]
	vcvt.f64.f32	d6, s15
	vldr.32	s15, [fp, #-20]
	vcvt.f64.f32	d7, s15
	vmov.f64	d5, #5.0e-1
	vmul.f64	d7, d7, d5
	vsub.f64	d7, d6, d7
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vcvt.f32.f64	s15, d7
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-48]
	vldr.32	s15, [fp, #-52]
	vmul.f32	s15, s14, s15
	vstr.32	s15, [fp, #-48]
	vldr.32	s14, [fp, #-44]
	vldr.32	s15, [fp, #-52]
	vmul.f32	s15, s14, s15
	vstr.32	s15, [fp, #-44]
	ldr	r3, [fp, #-80]
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-24]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-80]
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-80]
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-20]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-80]
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-44]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-48]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-44]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-48]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-72]
	sub	r3, r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bne	.L39
	nop
	ldr	r2, .L41+8
.LPIC3:
	add	r2, pc, r2
	ldr	r3, .L41+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L40
	bl	__stack_chk_fail(PLT)
.L40:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L42:
	.align	2
.L41:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+8)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC3+8)
	.size	kf_bfly3, .-kf_bfly3
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kf_bfly5, %function
kf_bfly5:
	@ args = 0, pretend = 0, frame = 176
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #176
	str	r0, [fp, #-168]
	str	r1, [fp, #-172]
	str	r2, [fp, #-176]
	str	r3, [fp, #-180]
	ldr	r2, .L47
.LPIC4:
	add	r2, pc, r2
	ldr	r3, .L47+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	mov	r3,#0
	ldr	r3, [fp, #-176]
	add	r3, r3, #264
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-180]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-136]
	add	r2, r2, r3
	sub	r3, fp, #128
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-180]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #4
	ldr	r2, [fp, #-136]
	add	r2, r2, r3
	sub	r3, fp, #120
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-168]
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-180]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-160]
	add	r3, r2, r3
	str	r3, [fp, #-156]
	ldr	r3, [fp, #-180]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-160]
	add	r3, r2, r3
	str	r3, [fp, #-152]
	ldr	r3, [fp, #-180]
	mov	r2, #24
	mul	r3, r2, r3
	ldr	r2, [fp, #-160]
	add	r3, r2, r3
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-180]
	lsl	r3, r3, #5
	ldr	r2, [fp, #-160]
	add	r3, r2, r3
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-176]
	add	r3, r3, #264
	str	r3, [fp, #-132]
	mov	r3, #0
	str	r3, [fp, #-140]
	b	.L44
.L45:
	ldr	r2, [fp, #-160]
	sub	r3, fp, #112
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-156]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-156]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-104]
	ldr	r3, [fp, #-156]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-156]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-100]
	ldr	r3, [fp, #-152]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #4
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-152]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #4
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-96]
	ldr	r3, [fp, #-152]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #4
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-152]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #4
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-92]
	ldr	r3, [fp, #-148]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	mov	r2, #24
	mul	r3, r2, r3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-148]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	mov	r2, #24
	mul	r3, r2, r3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-88]
	ldr	r3, [fp, #-148]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	mov	r2, #24
	mul	r3, r2, r3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-148]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	mov	r2, #24
	mul	r3, r2, r3
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-84]
	ldr	r3, [fp, #-144]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #5
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-144]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #5
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-80]
	ldr	r3, [fp, #-144]
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #5
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-144]
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-140]
	ldr	r2, [fp, #-172]
	mul	r3, r2, r3
	lsl	r3, r3, #5
	ldr	r2, [fp, #-132]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-76]
	vldr.32	s14, [fp, #-104]
	vldr.32	s15, [fp, #-80]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-56]
	vldr.32	s14, [fp, #-100]
	vldr.32	s15, [fp, #-76]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-52]
	vldr.32	s14, [fp, #-104]
	vldr.32	s15, [fp, #-80]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-32]
	vldr.32	s14, [fp, #-100]
	vldr.32	s15, [fp, #-76]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-28]
	vldr.32	s14, [fp, #-96]
	vldr.32	s15, [fp, #-88]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-48]
	vldr.32	s14, [fp, #-92]
	vldr.32	s15, [fp, #-84]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-44]
	vldr.32	s14, [fp, #-96]
	vldr.32	s15, [fp, #-88]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-40]
	vldr.32	s14, [fp, #-92]
	vldr.32	s15, [fp, #-84]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-36]
	ldr	r3, [fp, #-160]
	vldr.32	s14, [r3]
	vldr.32	s13, [fp, #-56]
	vldr.32	s15, [fp, #-48]
	vadd.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-160]
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-160]
	vldr.32	s14, [r3, #4]
	vldr.32	s13, [fp, #-52]
	vldr.32	s15, [fp, #-44]
	vadd.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-160]
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-112]
	vldr.32	s13, [fp, #-56]
	vldr.32	s15, [fp, #-128]
	vmul.f32	s15, s13, s15
	vadd.f32	s14, s14, s15
	vldr.32	s13, [fp, #-48]
	vldr.32	s15, [fp, #-120]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-72]
	vldr.32	s14, [fp, #-108]
	vldr.32	s13, [fp, #-52]
	vldr.32	s15, [fp, #-128]
	vmul.f32	s15, s13, s15
	vadd.f32	s14, s14, s15
	vldr.32	s13, [fp, #-44]
	vldr.32	s15, [fp, #-120]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-68]
	vldr.32	s14, [fp, #-28]
	vldr.32	s15, [fp, #-124]
	vmul.f32	s14, s14, s15
	vldr.32	s13, [fp, #-36]
	vldr.32	s15, [fp, #-116]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-64]
	vldr.32	s14, [fp, #-32]
	vldr.32	s15, [fp, #-124]
	vmul.f32	s15, s14, s15
	vneg.f32	s14, s15
	vldr.32	s13, [fp, #-40]
	vldr.32	s15, [fp, #-116]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-60]
	vldr.32	s14, [fp, #-72]
	vldr.32	s15, [fp, #-64]
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-156]
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-68]
	vldr.32	s15, [fp, #-60]
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-156]
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-72]
	vldr.32	s15, [fp, #-64]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-144]
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-68]
	vldr.32	s15, [fp, #-60]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-144]
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-112]
	vldr.32	s13, [fp, #-56]
	vldr.32	s15, [fp, #-120]
	vmul.f32	s15, s13, s15
	vadd.f32	s14, s14, s15
	vldr.32	s13, [fp, #-48]
	vldr.32	s15, [fp, #-128]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-24]
	vldr.32	s14, [fp, #-108]
	vldr.32	s13, [fp, #-52]
	vldr.32	s15, [fp, #-120]
	vmul.f32	s15, s13, s15
	vadd.f32	s14, s14, s15
	vldr.32	s13, [fp, #-44]
	vldr.32	s15, [fp, #-128]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-20]
	vldr.32	s14, [fp, #-36]
	vldr.32	s15, [fp, #-124]
	vmul.f32	s14, s14, s15
	vldr.32	s13, [fp, #-28]
	vldr.32	s15, [fp, #-116]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-16]
	vldr.32	s14, [fp, #-32]
	vldr.32	s15, [fp, #-116]
	vmul.f32	s14, s14, s15
	vldr.32	s13, [fp, #-40]
	vldr.32	s15, [fp, #-124]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-12]
	vldr.32	s14, [fp, #-24]
	vldr.32	s15, [fp, #-16]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-152]
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-20]
	vldr.32	s15, [fp, #-12]
	vadd.f32	s15, s14, s15
	ldr	r3, [fp, #-152]
	vstr.32	s15, [r3, #4]
	vldr.32	s14, [fp, #-24]
	vldr.32	s15, [fp, #-16]
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-148]
	vstr.32	s15, [r3]
	vldr.32	s14, [fp, #-20]
	vldr.32	s15, [fp, #-12]
	vsub.f32	s15, s14, s15
	ldr	r3, [fp, #-148]
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-160]
	add	r3, r3, #8
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-156]
	add	r3, r3, #8
	str	r3, [fp, #-156]
	ldr	r3, [fp, #-152]
	add	r3, r3, #8
	str	r3, [fp, #-152]
	ldr	r3, [fp, #-148]
	add	r3, r3, #8
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-144]
	add	r3, r3, #8
	str	r3, [fp, #-144]
	ldr	r3, [fp, #-140]
	add	r3, r3, #1
	str	r3, [fp, #-140]
.L44:
	ldr	r2, [fp, #-140]
	ldr	r3, [fp, #-180]
	cmp	r2, r3
	blt	.L45
	nop
	ldr	r2, .L47+8
.LPIC5:
	add	r2, pc, r2
	ldr	r3, .L47+4
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L46
	bl	__stack_chk_fail(PLT)
.L46:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L48:
	.align	2
.L47:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC4+8)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+8)
	.size	kf_bfly5, .-kf_bfly5
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kf_bfly_generic, %function
kf_bfly_generic:
	@ args = 4, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-56]
	add	r3, r3, #264
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #4]
	lsl	r3, r3, #3
	mov	r0, r3
	bl	malloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L50
.L58:
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L51
.L52:
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r1, r2, r3
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r2, r1
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-60]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L51:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	blt	.L52
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L53
.L57:
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L54
.L56:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-52]
	mul	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L55
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
.L55:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s15, s13, s15
	vsub.f32	s15, s14, s15
	vstr.32	s15, [fp, #-12]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	vldr.32	s15, [r3, #4]
	vmul.f32	s14, s14, s15
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	vldr.32	s13, [r3, #4]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s15, s13, s15
	vadd.f32	s15, s14, s15
	vstr.32	s15, [fp, #-8]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vldr.32	s14, [r3]
	vldr.32	s15, [fp, #-12]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vldr.32	s14, [r3, #4]
	vldr.32	s15, [fp, #-8]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r3, #4]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L54:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	blt	.L56
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-60]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L53:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	blt	.L57
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L50:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	blt	.L58
	ldr	r0, [fp, #-16]
	bl	free(PLT)
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	kf_bfly_generic, .-kf_bfly_generic
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kf_work, %function
kf_work:
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #4]
	add	r2, r3, #4
	str	r2, [fp, #4]
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #4]
	add	r2, r3, #4
	str	r2, [fp, #4]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	bne	.L60
.L61:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bne	.L61
	b	.L62
.L60:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r2, r2, r3
	ldr	r3, [fp, #8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #4]
	str	r3, [sp]
	ldr	r3, [fp, #-36]
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	kf_work(PLT)
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bne	.L60
.L62:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #2
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L63
.L65:
	b	.L68
	b	.L67
	b	.L66
	b	.L64
	.p2align 1
.L68:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-24]
	bl	kf_bfly2(PLT)
	b	.L69
.L67:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-24]
	bl	kf_bfly3(PLT)
	b	.L69
.L66:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-24]
	bl	kf_bfly4(PLT)
	b	.L69
.L64:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-24]
	bl	kf_bfly5(PLT)
	b	.L69
.L63:
	ldr	r3, [fp, #-16]
	str	r3, [sp]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-24]
	bl	kf_bfly_generic(PLT)
	nop
.L69:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	kf_work, .-kf_work
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.align	2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	kf_factor, %function
kf_factor:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #4
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vmov.f64	d0, d7
	bl	sqrt(PLT)
	vmov.f64	d7, d0
	vmov.f64	d0, d7
	bl	floor(PLT)
	vstr.64	d0, [fp, #-12]
	b	.L71
.L76:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	beq	.L72
	ldr	r3, [fp, #-16]
	cmp	r3, #4
	bne	.L73
	mov	r3, #2
	str	r3, [fp, #-16]
	b	.L74
.L72:
	mov	r3, #3
	str	r3, [fp, #-16]
	b	.L74
.L73:
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
	nop
.L74:
	ldr	r3, [fp, #-16]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, [fp, #-12]
	vcmpe.f64	d6, d7
	vmrs	APSR_nzcv, FPSCR
	bmi	.L78
	b	.L71
.L78:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
.L71:
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	__aeabi_idivmod(PLT)
	mov	r3, r1
	cmp	r3, #0
	bne	.L76
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-24]
	bl	__aeabi_idiv(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r2, r3, #4
	str	r2, [fp, #-28]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r2, r3, #4
	str	r2, [fp, #-28]
	ldr	r2, [fp, #-24]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bgt	.L71
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	kf_factor, .-kf_factor
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
