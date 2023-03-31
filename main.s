	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"main.c"
@ GNU C11 (GNU Tools for ARM Embedded Processors) version 5.3.1 20160307 (release) [ARM/embedded-5-branch revision 234589] (arm-none-eabi)
@	compiled by GNU C version 4.7.4, GMP version 4.3.2, MPFR version 2.4.2, MPC version 0.8.1
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -fpreprocessed main.i -mthumb-interwork -mlong-calls
@ -auxbase-strip main.o -O2 -Wall -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -falign-functions
@ -falign-jumps -falign-labels -falign-loops -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
@ -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
@ -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
@ -fchkp-use-static-bounds -fchkp-use-static-const-bounds
@ -fchkp-use-wrappers -fcombine-stack-adjustments -fcommon -fcompare-elim
@ -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdefer-pop
@ -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
@ -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
@ -fexpensive-optimizations -fforward-propagate -ffunction-cse -fgcse
@ -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
@ -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
@ -findirect-inlining -finline -finline-atomics
@ -finline-functions-called-once -finline-small-functions -fipa-cp
@ -fipa-cp-alignment -fipa-icf -fipa-icf-functions -fipa-icf-variables
@ -fipa-profile -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
@ -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
@ -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2
@ -fprefetch-loop-arrays -freg-struct-return -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-pressure -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns
@ -fschedule-insns2 -fsection-anchors -fsemantic-interposition
@ -fshow-column -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fssa-phiopt -fstdarg-opt -fstrict-aliasing
@ -fstrict-overflow -fstrict-volatile-bitfields -fsync-libcalls
@ -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
@ -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
@ -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
@ -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
@ -ftree-vrp -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm
@ -mlittle-endian -mlong-calls -mpic-data-is-text-relative -msched-prolog
@ -mthumb-interwork -mvectorize-with-neon-quad

	.text
	.align	2
	.global	Handler
	.type	Handler, %function
Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0	@ tmp186,
	ldr	r3, .L9	@ tmp184,
	ldrh	r1, [r3, #2]	@ MEM[(volatile u16 *)67109378B], MEM[(volatile u16 *)67109378B]
	tst	r1, #8	@ MEM[(volatile u16 *)67109378B],
	stmfd	sp!, {r4, r5, lr}	@,
	strh	r2, [r3, #8]	@ movhi	@ tmp186, MEM[(u16 *)67109384B]
	beq	.L3	@,
	ldr	r3, .L9+4	@ tmp205,
	ldr	r2, [r3]	@ count, count
	add	r2, r2, #1	@ temp, count,
	cmp	r2, #0	@ temp,
	str	r2, [r3]	@ temp, count
	ble	.L3	@,
	mov	ip, #120	@ ivtmp.13,
	mov	r1, #117440512	@ ivtmp.11,
	ldr	r5, .L9+8	@ tmp229,
	ldr	r4, .L9+12	@ tmp230,
.L4:
	smull	r3, r0, r4, r2	@ tmp231, tmp211, tmp230, temp
	mov	r3, r2, asr #31	@ tmp214, temp,
	rsb	r3, r3, r0, asr #2	@ tmp210, tmp214, tmp211,
	add	lr, r3, r3, lsl #2	@ tmp217, tmp210, tmp210,
	sub	r0, ip, #10	@ tmp227, ivtmp.13,
	sub	r2, r2, lr, asl #1	@ D.4297, temp, tmp217,
	mov	lr, r2, asl #1	@ tmp221, D.4297,
	mov	r0, r0, asl #16	@ tmp228, tmp227,
	subs	r2, r3, #0	@ temp, tmp210
	strh	ip, [r1, #2]	@ movhi	@ ivtmp.13, MEM[base: 0B, index: ivtmp.11_4, offset: 2B]
	strh	r5, [r1]	@ movhi	@ tmp229, MEM[base: 0B, index: ivtmp.11_4, offset: 0B]
	strh	lr, [r1, #4]	@ movhi	@ tmp221, MEM[base: 0B, index: ivtmp.11_4, offset: 4B]
	mov	ip, r0, lsr #16	@ ivtmp.13, tmp228,
	add	r1, r1, #8	@ ivtmp.11, ivtmp.11,
	bne	.L4	@,
.L3:
	mov	r1, #1	@ tmp204,
	ldr	r3, .L9	@ tmp196,
	ldrh	r2, [r3, #2]	@ MEM[(volatile u16 *)67109378B], MEM[(volatile u16 *)67109378B]
	strh	r1, [r3, #8]	@ movhi	@ tmp204, MEM[(u16 *)67109384B]
	strh	r2, [r3, #2]	@ movhi	@ D.4296, MEM[(volatile u16 *)67109378B]
	ldmfd	sp!, {r4, r5, lr}	@
	bx	lr	@
.L10:
	.align	2
.L9:
	.word	67109376
	.word	.LANCHOR0
	.word	8292
	.word	1717986919
	.size	Handler, .-Handler
	.align	2
	.global	drawSprite
	.type	drawSprite, %function
drawSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r1, #14680064	@ D.4300, N,
	mov	r1, r1, asl #3	@ D.4300, D.4300,
	orr	r3, r3, #8192	@ tmp130, y,
	mov	r0, r0, asl #1	@ tmp132, numb,
	strh	r2, [r1, #2]	@ movhi	@ x, *_13
	strh	r3, [r1]	@ movhi	@ tmp130, *_4
	strh	r0, [r1, #4]	@ movhi	@ tmp132, *_18
	bx	lr	@
	.size	drawSprite, .-drawSprite
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0	@ tmp125,
	mov	r0, #67108864	@ tmp120,
	mvn	r2, #32768	@ tmp128,
	ldr	r3, .L19	@ tmp123,
	ldr	ip, .L19+4	@ tmp122,
	strh	ip, [r0]	@ movhi	@ tmp122, MEM[(short unsigned int *)67108864B]
	strh	r1, [r3]	@ movhi	@ tmp125, MEM[(short unsigned int *)83886592B]
	strh	r2, [r3, #2]	@ movhi	@ tmp128, MEM[(short unsigned int *)83886594B]
	ldr	r1, .L19+8	@ ivtmp.40,
	ldr	r3, .L19+12	@ ivtmp.36,
	ldr	ip, .L19+16	@ tmp172,
.L13:
	ldrh	r0, [r3]	@ MEM[base: _55, offset: 0B], MEM[base: _55, offset: 0B]
	ldrh	r2, [r3, #-2]	@ MEM[base: _55, offset: 4294967294B], MEM[base: _55, offset: 4294967294B]
	add	r2, r2, r0, lsl #8	@ tmp136, MEM[base: _55, offset: 4294967294B], MEM[base: _55, offset: 0B],
	strh	r2, [r1, #2]!	@ movhi	@ tmp136, MEM[base: 0B, index: ivtmp.40_30, offset: 0B]
	cmp	r1, ip	@ ivtmp.40, tmp172
	add	r3, r3, #4	@ ivtmp.36, ivtmp.36,
	bne	.L13	@,
	stmfd	sp!, {r4, r5, lr}	@,
	mov	r3, #117440512	@ ivtmp.27,
	mov	lr, #240	@ tmp169,
	mov	ip, #0	@ tmp170,
	ldr	r0, .L19+20	@ tmp168,
	ldr	r1, .L19+24	@ tmp171,
.L14:
	strh	r0, [r3]	@ movhi	@ tmp168, MEM[base: 0B, index: ivtmp.27_51, offset: 0B]
	strh	lr, [r3, #2]	@ movhi	@ tmp169, MEM[base: 0B, index: ivtmp.27_51, offset: 2B]
	strh	ip, [r3, #4]	@ movhi	@ tmp170, MEM[base: 0B, index: ivtmp.27_51, offset: 4B]
	add	r3, r3, #8	@ ivtmp.27, ivtmp.27,
	cmp	r3, r1	@ ivtmp.27, tmp171
	mov	r2, #0	@ tmp143,
	bne	.L14	@,
	mov	r5, #8	@ tmp149,
	mov	r4, #1	@ tmp152,
	mov	ip, #195	@ tmp158,
	mov	r3, #117440512	@ tmp159,
	mov	lr, #120	@ tmp164,
	ldr	r0, .L19+28	@ tmp147,
	ldr	r1, .L19+32	@ tmp153,
	strh	r5, [r0]	@ movhi	@ tmp149, MEM[(u16 *)67109376B]
	strh	r4, [r0, #8]	@ movhi	@ tmp152, MEM[(u16 *)67109384B]
	ldr	r5, .L19+36	@ tmp155,
	strh	ip, [r1, #2]	@ movhi	@ tmp158, MEM[(u16 *)67109122B]
	ldr	r4, .L19+40	@ tmp161,
	ldr	r0, .L19+44	@ tmp145,
	ldr	ip, .L19+48	@ tmp146,
	strh	r5, [r1]	@ movhi	@ tmp155, MEM[(u16 *)67109120B]
	strh	r2, [r3, #4]	@ movhi	@ tmp143, MEM[(short unsigned int *)117440516B]
	strh	r4, [r3]	@ movhi	@ tmp161, MEM[(short unsigned int *)117440512B]
	strh	lr, [r3, #2]	@ movhi	@ tmp164, MEM[(short unsigned int *)117440514B]
	str	ip, [r0, #4092]	@ tmp146, MEM[(unsigned int *)50364412B]
.L15:
	b	.L15	@
.L20:
	.align	2
.L19:
	.word	83886592
	.word	4162
	.word	100728830
	.word	.LANCHOR1+2
	.word	100729470
	.word	8352
	.word	117441536
	.word	67109376
	.word	67109120
	.word	-15388
	.word	8292
	.word	50360320
	.word	Handler
	.size	main, .-main
	.global	count
	.global	numbers
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	numbers, %object
	.size	numbers, 1280
numbers:
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	count, %object
	.size	count, 4
count:
	.space	4
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.3.1 20160307 (release) [ARM/embedded-5-branch revision 234589]"
