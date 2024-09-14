	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_a2p0_c2p0"
	.file	"output.ll"
	.globl	main
	.p2align	1
	.type	main,@function
main:
	.cfi_startproc
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	.cfi_offset ra, -4
	lui	a0, %hi(n.0)
	sw	a0, 16(sp)
	call	getInt@plt
	lw	a1, 16(sp)
	sw	a0, %lo(n.0)(a1)
	lui	a0, %hi(p.0)
	sw	a0, 24(sp)
	call	getInt@plt
	lw	a1, 24(sp)
	sw	a0, %lo(p.0)(a1)
	lui	a0, %hi(k.0)
	sw	a0, 20(sp)
	call	getInt@plt
	lw	a1, 20(sp)
	mv	a2, a0
	lw	a0, 24(sp)
	sw	a2, %lo(k.0)(a1)
	lw	a0, %lo(p.0)(a0)
	lw	a1, %lo(k.0)(a1)
	sub	a0, a0, a1
	li	a1, 2
	blt	a0, a1, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lui	a0, %hi(_string.0)
	addi	a0, a0, %lo(_string.0)
	call	print@plt
	j	.LBB0_2
.LBB0_2:
	lui	a1, %hi(i.0)
	lui	a0, %hi(p.0)
	lw	a0, %lo(p.0)(a0)
	lui	a2, %hi(k.0)
	lw	a2, %lo(k.0)(a2)
	sub	a0, a0, a2
	sw	a0, %lo(i.0)(a1)
	j	.LBB0_3
.LBB0_3:
	lui	a0, %hi(i.0)
	lw	a1, %lo(i.0)(a0)
	lui	a0, %hi(p.0)
	lw	a0, %lo(p.0)(a0)
	lui	a2, %hi(k.0)
	lw	a2, %lo(k.0)(a2)
	add	a0, a0, a2
	blt	a0, a1, .LBB0_14
	j	.LBB0_4
.LBB0_4:
	lui	a0, %hi(i.0)
	lw	a1, %lo(i.0)(a0)
	li	a0, 0
	slt	a2, a0, a1
	sw	a2, 12(sp)
	bge	a0, a1, .LBB0_6
	j	.LBB0_5
.LBB0_5:
	lui	a0, %hi(i.0)
	lw	a1, %lo(i.0)(a0)
	lui	a0, %hi(n.0)
	lw	a0, %lo(n.0)(a0)
	slt	a0, a0, a1
	xori	a0, a0, 1
	sw	a0, 8(sp)
	j	.LBB0_7
.LBB0_6:
	lw	a0, 12(sp)
	sw	a0, 8(sp)
	j	.LBB0_7
.LBB0_7:
	lw	a0, 8(sp)
	andi	a0, a0, 1
	li	a1, 0
	beq	a0, a1, .LBB0_12
	j	.LBB0_8
.LBB0_8:
	lui	a0, %hi(i.0)
	lw	a0, %lo(i.0)(a0)
	lui	a1, %hi(p.0)
	lw	a1, %lo(p.0)(a1)
	bne	a0, a1, .LBB0_10
	j	.LBB0_9
.LBB0_9:
	lui	a0, %hi(_string.1)
	addi	a0, a0, %lo(_string.1)
	call	print@plt
	lui	a0, %hi(i.0)
	lw	a0, %lo(i.0)(a0)
	call	toString@plt
	call	print@plt
	lui	a0, %hi(_string.2)
	addi	a0, a0, %lo(_string.2)
	call	print@plt
	j	.LBB0_11
.LBB0_10:
	lui	a0, %hi(i.0)
	lw	a0, %lo(i.0)(a0)
	call	printInt@plt
	lui	a0, %hi(_string.3)
	addi	a0, a0, %lo(_string.3)
	call	print@plt
	j	.LBB0_11
.LBB0_11:
	j	.LBB0_12
.LBB0_12:
	j	.LBB0_13
.LBB0_13:
	lui	a1, %hi(i.0)
	lw	a0, %lo(i.0)(a1)
	addi	a0, a0, 1
	sw	a0, %lo(i.0)(a1)
	j	.LBB0_3
.LBB0_14:
	lui	a0, %hi(p.0)
	lw	a0, %lo(p.0)(a0)
	lui	a1, %hi(k.0)
	lw	a1, %lo(k.0)(a1)
	add	a0, a0, a1
	lui	a1, %hi(n.0)
	lw	a1, %lo(n.0)(a1)
	bge	a0, a1, .LBB0_16
	j	.LBB0_15
.LBB0_15:
	lui	a0, %hi(_string.4)
	addi	a0, a0, %lo(_string.4)
	call	print@plt
	j	.LBB0_16
.LBB0_16:
	li	a0, 0
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	n.0,@object
	.section	.sbss,"aw",@nobits
	.globl	n.0
	.p2align	2
n.0:
	.word	0
	.size	n.0, 4

	.type	p.0,@object
	.globl	p.0
	.p2align	2
p.0:
	.word	0
	.size	p.0, 4

	.type	i.0,@object
	.globl	i.0
	.p2align	2
i.0:
	.word	0
	.size	i.0, 4

	.type	k.0,@object
	.globl	k.0
	.p2align	2
k.0:
	.word	0
	.size	k.0, 4

	.type	_string.0,@object
	.section	.rodata,"a",@progbits
	.globl	_string.0
_string.0:
	.asciz	"<< "
	.size	_string.0, 4

	.type	_string.1,@object
	.globl	_string.1
_string.1:
	.asciz	"("
	.size	_string.1, 2

	.type	_string.2,@object
	.globl	_string.2
_string.2:
	.asciz	") "
	.size	_string.2, 3

	.type	_string.3,@object
	.globl	_string.3
_string.3:
	.asciz	" "
	.size	_string.3, 2

	.type	_string.4,@object
	.globl	_string.4
_string.4:
	.asciz	">> "
	.size	_string.4, 4

	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym print
	.addrsig_sym printInt
	.addrsig_sym getInt
	.addrsig_sym toString
	.addrsig_sym n.0
	.addrsig_sym p.0
	.addrsig_sym i.0
	.addrsig_sym k.0
	.addrsig_sym _string.0
	.addrsig_sym _string.1
	.addrsig_sym _string.2
	.addrsig_sym _string.3
	.addrsig_sym _string.4
