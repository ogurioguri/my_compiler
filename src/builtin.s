	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_a2p0_c2p0"
	.file	"builtin.c"
	.globl	print
	.p2align	1
	.type	print,@function
print:
	mv	a1, a0
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	tail	printf
.Lfunc_end0:
	.size	print, .Lfunc_end0-print

	.globl	println
	.p2align	1
	.type	println,@function
println:
	mv	a1, a0
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	tail	printf
.Lfunc_end1:
	.size	println, .Lfunc_end1-println

	.globl	printInt
	.p2align	1
	.type	printInt,@function
printInt:
	mv	a1, a0
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	tail	printf
.Lfunc_end2:
	.size	printInt, .Lfunc_end2-printInt

	.globl	printlnInt
	.p2align	1
	.type	printlnInt,@function
printlnInt:
	mv	a1, a0
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	tail	printf
.Lfunc_end3:
	.size	printlnInt, .Lfunc_end3-printlnInt

	.globl	_malloc_array
	.p2align	1
	.type	_malloc_array,@function
_malloc_array:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	a1, 8(sp)
	mul	a0, a1, a0
	addi	a0, a0, 4
	call	malloc
	lw	a1, 8(sp)
	sw	a1, 0(a0)
	addi	a0, a0, 4
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	_malloc_array, .Lfunc_end4-_malloc_array

	.globl	_malloc
	.p2align	1
	.type	_malloc,@function
_malloc:
	tail	malloc
.Lfunc_end5:
	.size	_malloc, .Lfunc_end5-_malloc

	.globl	getString
	.p2align	1
	.type	getString,@function
getString:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	li	a0, 256
	call	malloc
	mv	a1, a0
	sw	a1, 8(sp)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end6:
	.size	getString, .Lfunc_end6-getString

	.globl	getInt
	.p2align	1
	.type	getInt,@function
getInt:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	addi	a1, sp, 8
	call	scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end7:
	.size	getInt, .Lfunc_end7-getInt

	.globl	toString
	.p2align	1
	.type	toString,@function
toString:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	a0, 4(sp)
	li	a0, 12
	call	malloc
	lw	a2, 4(sp)
	sw	a0, 8(sp)
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	call	sprintf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end8:
	.size	toString, .Lfunc_end8-toString

	.globl	_string.length
	.p2align	1
	.type	_string.length,@function
_string.length:
	addi	sp, sp, -16
	sw	a0, 8(sp)
	li	a0, 0
	sw	a0, 12(sp)
	j	.LBB9_1
.LBB9_1:
	lw	a1, 12(sp)
	lw	a0, 8(sp)
	sw	a1, 4(sp)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a2, a1, 1
	li	a1, 0
	sw	a2, 12(sp)
	bne	a0, a1, .LBB9_1
	j	.LBB9_2
.LBB9_2:
	lw	a0, 4(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end9:
	.size	_string.length, .Lfunc_end9-_string.length

	.globl	_string.substring
	.p2align	1
	.type	_string.substring,@function
_string.substring:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	a1, 8(sp)
	sw	a0, 12(sp)
	sub	a0, a2, a1
	sw	a0, 16(sp)
	addi	a0, a0, 1
	call	malloc
	lw	a1, 16(sp)
	sw	a0, 20(sp)
	li	a0, 0
	mv	a2, a0
	sw	a2, 24(sp)
	blt	a0, a1, .LBB10_2
	j	.LBB10_1
.LBB10_1:
	lw	a0, 20(sp)
	lw	a1, 16(sp)
	add	a2, a0, a1
	li	a1, 0
	sb	a1, 0(a2)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.LBB10_2:
	lw	a1, 16(sp)
	lw	a0, 24(sp)
	lw	a3, 20(sp)
	lw	a2, 12(sp)
	lw	a4, 8(sp)
	add	a4, a4, a0
	add	a2, a2, a4
	lb	a2, 0(a2)
	add	a3, a3, a0
	sb	a2, 0(a3)
	addi	a0, a0, 1
	mv	a2, a0
	sw	a2, 24(sp)
	beq	a0, a1, .LBB10_1
	j	.LBB10_2
.Lfunc_end10:
	.size	_string.substring, .Lfunc_end10-_string.substring

	.globl	_string.parseInt
	.p2align	1
	.type	_string.parseInt,@function
_string.parseInt:
	addi	sp, sp, -32
	sw	a0, 12(sp)
	lbu	a1, 0(a0)
	addi	a1, a1, -45
	seqz	a3, a1
	mv	a1, a3
	sw	a1, 16(sp)
	add	a0, a0, a3
	lbu	a0, 0(a0)
	li	a1, 0
	mv	a2, a1
	mv	a4, a0
	sw	a4, 20(sp)
	sw	a3, 24(sp)
	sw	a2, 28(sp)
	beq	a0, a1, .LBB11_2
	j	.LBB11_1
.LBB11_1:
	lw	a2, 28(sp)
	lw	a1, 24(sp)
	lw	a3, 20(sp)
	lw	a0, 12(sp)
	andi	a3, a3, 255
	li	a4, 10
	mul	a2, a2, a4
	add	a2, a2, a3
	addi	a2, a2, -48
	addi	a3, a1, 1
	add	a0, a0, a3
	lbu	a0, 0(a0)
	li	a1, 0
	mv	a4, a0
	sw	a4, 20(sp)
	sw	a3, 24(sp)
	sw	a2, 28(sp)
	bne	a0, a1, .LBB11_1
	j	.LBB11_2
.LBB11_2:
	lw	a0, 16(sp)
	lw	a2, 28(sp)
	sw	a2, 4(sp)
	li	a1, 0
	sub	a2, a1, a2
	andi	a0, a0, 1
	sw	a2, 8(sp)
	bne	a0, a1, .LBB11_4
	lw	a0, 4(sp)
	sw	a0, 8(sp)
.LBB11_4:
	lw	a0, 8(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end11:
	.size	_string.parseInt, .Lfunc_end11-_string.parseInt

	.globl	_string.ord
	.p2align	1
	.type	_string.ord,@function
_string.ord:
	add	a0, a0, a1
	lbu	a0, 0(a0)
	ret
.Lfunc_end12:
	.size	_string.ord, .Lfunc_end12-_string.ord

	.globl	_string.compare
	.p2align	1
	.type	_string.compare,@function
_string.compare:
	addi	sp, sp, -48
	sw	a1, 24(sp)
	sw	a0, 28(sp)
	lbu	a0, 0(a0)
	li	a1, 0
	mv	a2, a1
	mv	a3, a1
	mv	a4, a0
	sw	a4, 32(sp)
	mv	a4, a3
	sw	a4, 36(sp)
	sw	a3, 40(sp)
	sw	a2, 44(sp)
	beq	a0, a1, .LBB13_4
	j	.LBB13_1
.LBB13_1:
	lw	a0, 24(sp)
	lw	a2, 32(sp)
	lw	a3, 36(sp)
	sw	a3, 12(sp)
	sw	a2, 16(sp)
	add	a0, a0, a3
	lbu	a0, 0(a0)
	sw	a0, 20(sp)
	li	a1, 0
	sw	a3, 40(sp)
	sw	a2, 44(sp)
	beq	a0, a1, .LBB13_4
	j	.LBB13_2
.LBB13_2:
	lw	a2, 20(sp)
	lw	a3, 16(sp)
	andi	a1, a2, 255
	andi	a0, a3, 255
	sw	a3, 4(sp)
	sw	a2, 8(sp)
	bne	a0, a1, .LBB13_5
	j	.LBB13_3
.LBB13_3:
	lw	a0, 28(sp)
	lw	a1, 12(sp)
	addi	a3, a1, 1
	add	a0, a0, a3
	lbu	a0, 0(a0)
	li	a1, 0
	mv	a2, a1
	mv	a4, a0
	sw	a4, 32(sp)
	mv	a4, a3
	sw	a4, 36(sp)
	sw	a3, 40(sp)
	sw	a2, 44(sp)
	bne	a0, a1, .LBB13_1
	j	.LBB13_4
.LBB13_4:
	lw	a0, 24(sp)
	lw	a2, 40(sp)
	lw	a1, 44(sp)
	add	a0, a0, a2
	lbu	a0, 0(a0)
	sw	a1, 4(sp)
	sw	a0, 8(sp)
	j	.LBB13_5
.LBB13_5:
	lw	a0, 4(sp)
	lw	a1, 8(sp)
	andi	a0, a0, 255
	andi	a1, a1, 255
	sub	a0, a0, a1
	addi	sp, sp, 48
	ret
.Lfunc_end13:
	.size	_string.compare, .Lfunc_end13-_string.compare

	.globl	_string.concat
	.p2align	1
	.type	_string.concat,@function
_string.concat:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	a1, 32(sp)
	sw	a0, 36(sp)
	li	a0, 0
	sw	a0, 40(sp)
	j	.LBB14_1
.LBB14_1:
	lw	a1, 40(sp)
	lw	a0, 36(sp)
	sw	a1, 24(sp)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a3, a1, 1
	li	a1, 0
	mv	a2, a1
	sw	a3, 40(sp)
	sw	a2, 28(sp)
	bne	a0, a1, .LBB14_1
	j	.LBB14_2
.LBB14_2:
	lw	a1, 28(sp)
	lw	a0, 32(sp)
	sw	a1, 20(sp)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a2, a1, 1
	li	a1, 0
	sw	a2, 28(sp)
	bne	a0, a1, .LBB14_2
	j	.LBB14_3
.LBB14_3:
	lw	a1, 24(sp)
	lw	a0, 20(sp)
	add	a0, a0, a1
	sw	a0, 8(sp)
	addi	a0, a0, 1
	call	malloc
	mv	a1, a0
	lw	a0, 24(sp)
	sw	a1, 12(sp)
	li	a1, 0
	mv	a2, a1
	sw	a2, 16(sp)
	bne	a0, a1, .LBB14_5
	j	.LBB14_4
.LBB14_4:
	lw	a0, 20(sp)
	li	a1, 0
	mv	a2, a1
	sw	a2, 4(sp)
	beq	a0, a1, .LBB14_6
	j	.LBB14_7
.LBB14_5:
	lw	a1, 24(sp)
	lw	a0, 16(sp)
	lw	a3, 12(sp)
	lw	a2, 36(sp)
	add	a2, a2, a0
	lb	a2, 0(a2)
	add	a3, a3, a0
	sb	a2, 0(a3)
	addi	a0, a0, 1
	mv	a2, a0
	sw	a2, 16(sp)
	beq	a0, a1, .LBB14_4
	j	.LBB14_5
.LBB14_6:
	lw	a0, 12(sp)
	lw	a1, 8(sp)
	add	a2, a0, a1
	li	a1, 0
	sb	a1, 0(a2)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.LBB14_7:
	lw	a1, 20(sp)
	lw	a0, 4(sp)
	lw	a3, 12(sp)
	lw	a4, 24(sp)
	lw	a2, 32(sp)
	add	a2, a2, a0
	lb	a2, 0(a2)
	add	a4, a4, a0
	add	a3, a3, a4
	sb	a2, 0(a3)
	addi	a0, a0, 1
	mv	a2, a0
	sw	a2, 4(sp)
	beq	a0, a1, .LBB14_6
	j	.LBB14_7
.Lfunc_end14:
	.size	_string.concat, .Lfunc_end14-_string.concat

	.globl	_string.copy
	.p2align	1
	.type	_string.copy,@function
_string.copy:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	a0, 20(sp)
	li	a0, 0
	sw	a0, 24(sp)
	j	.LBB15_1
.LBB15_1:
	lw	a1, 24(sp)
	lw	a0, 20(sp)
	sw	a1, 12(sp)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a2, a1, 1
	sw	a2, 16(sp)
	li	a1, 0
	sw	a2, 24(sp)
	bne	a0, a1, .LBB15_1
	j	.LBB15_2
.LBB15_2:
	lw	a0, 16(sp)
	call	malloc
	mv	a1, a0
	lw	a0, 12(sp)
	sw	a1, 4(sp)
	li	a1, 0
	mv	a2, a1
	sw	a2, 8(sp)
	bne	a0, a1, .LBB15_4
	j	.LBB15_3
.LBB15_3:
	lw	a0, 4(sp)
	lw	a1, 12(sp)
	add	a2, a0, a1
	li	a1, 0
	sb	a1, 0(a2)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.LBB15_4:
	lw	a1, 12(sp)
	lw	a0, 8(sp)
	lw	a3, 4(sp)
	lw	a2, 20(sp)
	add	a2, a2, a0
	lb	a2, 0(a2)
	add	a3, a3, a0
	sb	a2, 0(a3)
	addi	a0, a0, 1
	mv	a2, a0
	sw	a2, 8(sp)
	beq	a0, a1, .LBB15_3
	j	.LBB15_4
.Lfunc_end15:
	.size	_string.copy, .Lfunc_end15-_string.copy

	.type	.L.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	.L.str.1,@object
.L.str.1:
	.asciz	"%s\n"
	.size	.L.str.1, 4

	.type	.L.str.2,@object
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

	.ident	"Ubuntu clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
