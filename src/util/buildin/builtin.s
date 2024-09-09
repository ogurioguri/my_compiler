	.text
	.file	"builtin.c"
	.globl	print                           # -- Begin function print
	.p2align	4, 0x90
	.type	print,@function
print:                                  # @print
.Lprint$local:
# %bb.0:
	movq	%rdi, %rsi
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	jmp	printf                          # TAILCALL
.Lfunc_end0:
	.size	print, .Lfunc_end0-print
                                        # -- End function
	.globl	println                         # -- Begin function println
	.p2align	4, 0x90
	.type	println,@function
println:                                # @println
.Lprintln$local:
# %bb.0:
	movq	%rdi, %rsi
	leaq	.L.str.1(%rip), %rdi
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	jmp	printf                          # TAILCALL
.Lfunc_end1:
	.size	println, .Lfunc_end1-println
                                        # -- End function
	.globl	printInt                        # -- Begin function printInt
	.p2align	4, 0x90
	.type	printInt,@function
printInt:                               # @printInt
.LprintInt$local:
# %bb.0:
	movl	%edi, %esi
	leaq	.L.str.2(%rip), %rdi
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	jmp	printf                          # TAILCALL
.Lfunc_end2:
	.size	printInt, .Lfunc_end2-printInt
                                        # -- End function
	.globl	printlnInt                      # -- Begin function printlnInt
	.p2align	4, 0x90
	.type	printlnInt,@function
printlnInt:                             # @printlnInt
.LprintlnInt$local:
# %bb.0:
	movl	%edi, %esi
	leaq	.L.str.3(%rip), %rdi
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	jmp	printf                          # TAILCALL
.Lfunc_end3:
	.size	printlnInt, .Lfunc_end3-printlnInt
                                        # -- End function
	.globl	_malloc_array                   # -- Begin function _malloc_array
	.p2align	4, 0x90
	.type	_malloc_array,@function
_malloc_array:                          # @_malloc_array
.L_malloc_array$local:
# %bb.0:
	pushq	%rax
	movl	%esi, (%rsp)                    # 4-byte Spill
	movl	%edi, %eax
	movl	(%rsp), %edi                    # 4-byte Reload
	movl	%edi, 4(%rsp)                   # 4-byte Spill
	imull	%eax, %edi
	addl	$4, %edi
	callq	malloc
	movl	4(%rsp), %esi                   # 4-byte Reload
	movl	%esi, (%rax)
	addq	$4, %rax
	popq	%rcx
	retq
.Lfunc_end4:
	.size	_malloc_array, .Lfunc_end4-_malloc_array
                                        # -- End function
	.globl	_malloc                         # -- Begin function _malloc
	.p2align	4, 0x90
	.type	_malloc,@function
_malloc:                                # @_malloc
.L_malloc$local:
# %bb.0:
	jmp	malloc                          # TAILCALL
.Lfunc_end5:
	.size	_malloc, .Lfunc_end5-_malloc
                                        # -- End function
	.globl	getString                       # -- Begin function getString
	.p2align	4, 0x90
	.type	getString,@function
getString:                              # @getString
.LgetString$local:
# %bb.0:
	pushq	%rax
	movl	$256, %edi                      # imm = 0x100
	callq	malloc
	movq	%rax, %rsi
	movq	%rsi, (%rsp)                    # 8-byte Spill
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	scanf
                                        # kill: def $ecx killed $eax
	movq	(%rsp), %rax                    # 8-byte Reload
	popq	%rcx
	retq
.Lfunc_end6:
	.size	getString, .Lfunc_end6-getString
                                        # -- End function
	.globl	getInt                          # -- Begin function getInt
	.p2align	4, 0x90
	.type	getInt,@function
getInt:                                 # @getInt
.LgetInt$local:
# %bb.0:
	pushq	%rax
	leaq	.L.str.2(%rip), %rdi
	leaq	4(%rsp), %rsi
	movb	$0, %al
	callq	scanf
	movl	4(%rsp), %eax
	popq	%rcx
	retq
.Lfunc_end7:
	.size	getInt, .Lfunc_end7-getInt
                                        # -- End function
	.globl	toString                        # -- Begin function toString
	.p2align	4, 0x90
	.type	toString,@function
toString:                               # @toString
.LtoString$local:
# %bb.0:
	subq	$24, %rsp
	movl	%edi, 12(%rsp)                  # 4-byte Spill
	movl	$12, %edi
	callq	malloc
	movl	12(%rsp), %edx                  # 4-byte Reload
	movq	%rax, %rdi
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	leaq	.L.str.2(%rip), %rsi
	movb	$0, %al
	callq	sprintf
                                        # kill: def $ecx killed $eax
	movq	16(%rsp), %rax                  # 8-byte Reload
	addq	$24, %rsp
	retq
.Lfunc_end8:
	.size	toString, .Lfunc_end8-toString
                                        # -- End function
	.globl	_string.length                  # -- Begin function _string.length
	.p2align	4, 0x90
	.type	_string.length,@function
_string.length:                         # @_string.length
.L_string.length$local:
# %bb.0:
	movq	%rdi, -16(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	movl	%eax, -4(%rsp)                  # 4-byte Spill
	jmp	.LBB9_1
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rsp), %eax                  # 4-byte Reload
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	movl	%eax, -20(%rsp)                 # 4-byte Spill
	movslq	%eax, %rdx
	movb	(%rcx,%rdx), %cl
	addl	$1, %eax
	cmpb	$0, %cl
	movl	%eax, -4(%rsp)                  # 4-byte Spill
	jne	.LBB9_1
# %bb.2:
	movl	-20(%rsp), %eax                 # 4-byte Reload
	retq
.Lfunc_end9:
	.size	_string.length, .Lfunc_end9-_string.length
                                        # -- End function
	.globl	_string.substring               # -- Begin function _string.substring
	.p2align	4, 0x90
	.type	_string.substring,@function
_string.substring:                      # @_string.substring
.L_string.substring$local:
# %bb.0:
	subq	$40, %rsp
	movl	%edx, 4(%rsp)                   # 4-byte Spill
	movq	%rdi, %rax
	movl	4(%rsp), %edi                   # 4-byte Reload
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movl	%esi, 16(%rsp)                  # 4-byte Spill
	subl	%esi, %edi
	movl	%edi, 20(%rsp)                  # 4-byte Spill
	addl	$1, %edi
	callq	malloc
	movl	20(%rsp), %edx                  # 4-byte Reload
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	xorl	%eax, %eax
	cmpl	$0, %edx
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	jg	.LBB10_2
.LBB10_1:
	movq	24(%rsp), %rax                  # 8-byte Reload
	movl	20(%rsp), %ecx                  # 4-byte Reload
	movslq	%ecx, %rcx
	movb	$0, (%rax,%rcx)
	addq	$40, %rsp
	retq
.LBB10_2:                               # =>This Inner Loop Header: Depth=1
	movl	36(%rsp), %eax                  # 4-byte Reload
	movl	20(%rsp), %ecx                  # 4-byte Reload
	movq	24(%rsp), %rdx                  # 8-byte Reload
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movl	16(%rsp), %edi                  # 4-byte Reload
	movl	%eax, %r8d
	addl	%edi, %r8d
	movslq	%r8d, %rdi
	movb	(%rsi,%rdi), %dil
	movslq	%eax, %rsi
	movslq	%r8d, %r8
	movb	%dil, (%rdx,%rsi)
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	je	.LBB10_1
	jmp	.LBB10_2
.Lfunc_end10:
	.size	_string.substring, .Lfunc_end10-_string.substring
                                        # -- End function
	.globl	_string.parseInt                # -- Begin function _string.parseInt
	.p2align	4, 0x90
	.type	_string.parseInt,@function
_string.parseInt:                       # @_string.parseInt
.L_string.parseInt$local:
# %bb.0:
	movq	%rdi, -24(%rsp)                 # 8-byte Spill
	cmpb	$45, (%rdi)
	sete	%al
	movb	%al, -10(%rsp)                  # 1-byte Spill
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rax
	movb	(%rdi,%rax), %dl
	xorl	%eax, %eax
	cmpb	$0, %dl
	movb	%dl, -9(%rsp)                   # 1-byte Spill
	movl	%ecx, -8(%rsp)                  # 4-byte Spill
	movl	%eax, -4(%rsp)                  # 4-byte Spill
	je	.LBB11_2
.LBB11_1:                               # =>This Inner Loop Header: Depth=1
	movl	-4(%rsp), %eax                  # 4-byte Reload
	movl	-8(%rsp), %ecx                  # 4-byte Reload
	movb	-9(%rsp), %sil                  # 1-byte Reload
	movq	-24(%rsp), %rdx                 # 8-byte Reload
	movzbl	%sil, %esi
	imull	$10, %eax, %eax
	addl	$-48, %eax
	addl	%esi, %eax
	addl	$1, %ecx
	movslq	%ecx, %rsi
	movb	(%rdx,%rsi), %dl
	cmpb	$0, %dl
	movb	%dl, -9(%rsp)                   # 1-byte Spill
	movl	%ecx, -8(%rsp)                  # 4-byte Spill
	movl	%eax, -4(%rsp)                  # 4-byte Spill
	jne	.LBB11_1
.LBB11_2:
	movb	-10(%rsp), %dl                  # 1-byte Reload
	movl	-4(%rsp), %eax                  # 4-byte Reload
	xorl	%ecx, %ecx
	subl	%eax, %ecx
	testb	$1, %dl
	cmovnel	%ecx, %eax
	retq
.Lfunc_end11:
	.size	_string.parseInt, .Lfunc_end11-_string.parseInt
                                        # -- End function
	.globl	_string.ord                     # -- Begin function _string.ord
	.p2align	4, 0x90
	.type	_string.ord,@function
_string.ord:                            # @_string.ord
.L_string.ord$local:
# %bb.0:
	movslq	%esi, %rax
	movzbl	(%rdi,%rax), %eax
	retq
.Lfunc_end12:
	.size	_string.ord, .Lfunc_end12-_string.ord
                                        # -- End function
	.globl	_string.compare                 # -- Begin function _string.compare
	.p2align	4, 0x90
	.type	_string.compare,@function
_string.compare:                        # @_string.compare
.L_string.compare$local:
# %bb.0:
	movq	%rdi, -32(%rsp)                 # 8-byte Spill
	movq	%rsi, -24(%rsp)                 # 8-byte Spill
	movb	(%rdi), %dl
	xorl	%ecx, %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpb	$0, %dl
	movb	%dl, -13(%rsp)                  # 1-byte Spill
	movl	%ecx, %edx
	movl	%edx, -12(%rsp)                 # 4-byte Spill
	movl	%ecx, -8(%rsp)                  # 4-byte Spill
	movb	%al, -1(%rsp)                   # 1-byte Spill
	je	.LBB13_4
.LBB13_1:                               # =>This Inner Loop Header: Depth=1
	movq	-24(%rsp), %rdx                 # 8-byte Reload
	movb	-13(%rsp), %al                  # 1-byte Reload
	movl	-12(%rsp), %ecx                 # 4-byte Reload
	movl	%ecx, -40(%rsp)                 # 4-byte Spill
	movb	%al, -34(%rsp)                  # 1-byte Spill
	movslq	%ecx, %rsi
	movb	(%rdx,%rsi), %dl
	movb	%dl, -33(%rsp)                  # 1-byte Spill
	cmpb	$0, %dl
	movl	%ecx, -8(%rsp)                  # 4-byte Spill
	movb	%al, -1(%rsp)                   # 1-byte Spill
	je	.LBB13_4
# %bb.2:                                #   in Loop: Header=BB13_1 Depth=1
	movb	-33(%rsp), %al                  # 1-byte Reload
	movb	-34(%rsp), %cl                  # 1-byte Reload
	cmpb	%al, %cl
	movb	%cl, -42(%rsp)                  # 1-byte Spill
	movb	%al, -41(%rsp)                  # 1-byte Spill
	jne	.LBB13_5
# %bb.3:                                #   in Loop: Header=BB13_1 Depth=1
	movq	-32(%rsp), %rax                 # 8-byte Reload
	movl	-40(%rsp), %ecx                 # 4-byte Reload
	addl	$1, %ecx
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %dl
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpb	$0, %dl
	movb	%dl, -13(%rsp)                  # 1-byte Spill
	movl	%ecx, %edx
	movl	%edx, -12(%rsp)                 # 4-byte Spill
	movl	%ecx, -8(%rsp)                  # 4-byte Spill
	movb	%al, -1(%rsp)                   # 1-byte Spill
	jne	.LBB13_1
.LBB13_4:
	movq	-24(%rsp), %rax                 # 8-byte Reload
	movl	-8(%rsp), %edx                  # 4-byte Reload
	movb	-1(%rsp), %cl                   # 1-byte Reload
	movslq	%edx, %rdx
	movb	(%rax,%rdx), %al
	movb	%cl, -42(%rsp)                  # 1-byte Spill
	movb	%al, -41(%rsp)                  # 1-byte Spill
.LBB13_5:
	movb	-42(%rsp), %al                  # 1-byte Reload
	movb	-41(%rsp), %cl                  # 1-byte Reload
	movzbl	%al, %eax
	movzbl	%cl, %ecx
	subl	%ecx, %eax
	retq
.Lfunc_end13:
	.size	_string.compare, .Lfunc_end13-_string.compare
                                        # -- End function
	.globl	_string.concat                  # -- Begin function _string.concat
	.p2align	4, 0x90
	.type	_string.concat,@function
_string.concat:                         # @_string.concat
.L_string.concat$local:
# %bb.0:
	subq	$56, %rsp
	movq	%rdi, 32(%rsp)                  # 8-byte Spill
	movq	%rsi, 40(%rsp)                  # 8-byte Spill
	xorl	%eax, %eax
	movl	%eax, 52(%rsp)                  # 4-byte Spill
	jmp	.LBB14_1
.LBB14_1:                               # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %ecx                  # 4-byte Reload
	movq	32(%rsp), %rax                  # 8-byte Reload
	movl	%ecx, 24(%rsp)                  # 4-byte Spill
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %dl
	addl	$1, %ecx
	xorl	%eax, %eax
	cmpb	$0, %dl
	movl	%ecx, 52(%rsp)                  # 4-byte Spill
	movl	%eax, 28(%rsp)                  # 4-byte Spill
	jne	.LBB14_1
.LBB14_2:                               # =>This Inner Loop Header: Depth=1
	movl	28(%rsp), %eax                  # 4-byte Reload
	movq	40(%rsp), %rcx                  # 8-byte Reload
	movl	%eax, 20(%rsp)                  # 4-byte Spill
	movslq	%eax, %rdx
	movb	(%rcx,%rdx), %cl
	addl	$1, %eax
	cmpb	$0, %cl
	movl	%eax, 28(%rsp)                  # 4-byte Spill
	jne	.LBB14_2
# %bb.3:
	movl	24(%rsp), %eax                  # 4-byte Reload
	movl	20(%rsp), %edi                  # 4-byte Reload
	addl	%eax, %edi
	movl	%edi, 4(%rsp)                   # 4-byte Spill
	addl	$1, %edi
	callq	malloc
	movl	24(%rsp), %ecx                  # 4-byte Reload
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	xorl	%eax, %eax
	cmpl	$0, %ecx
	movl	%eax, 16(%rsp)                  # 4-byte Spill
	jne	.LBB14_5
.LBB14_4:
	movl	20(%rsp), %ecx                  # 4-byte Reload
	xorl	%eax, %eax
	cmpl	$0, %ecx
	movl	%eax, (%rsp)                    # 4-byte Spill
	je	.LBB14_6
	jmp	.LBB14_7
.LBB14_5:                               # =>This Inner Loop Header: Depth=1
	movl	16(%rsp), %eax                  # 4-byte Reload
	movl	24(%rsp), %ecx                  # 4-byte Reload
	movq	8(%rsp), %rdx                   # 8-byte Reload
	movq	32(%rsp), %rsi                  # 8-byte Reload
	movslq	%eax, %rdi
	movb	(%rsi,%rdi), %dil
	movslq	%eax, %rsi
	movslq	%eax, %r8
	movb	%dil, (%rdx,%rsi)
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 16(%rsp)                  # 4-byte Spill
	je	.LBB14_4
	jmp	.LBB14_5
.LBB14_6:
	movq	8(%rsp), %rax                   # 8-byte Reload
	movl	4(%rsp), %ecx                   # 4-byte Reload
	movslq	%ecx, %rcx
	movb	$0, (%rax,%rcx)
	addq	$56, %rsp
	retq
.LBB14_7:                               # =>This Inner Loop Header: Depth=1
	movl	(%rsp), %eax                    # 4-byte Reload
	movl	20(%rsp), %ecx                  # 4-byte Reload
	movq	8(%rsp), %rdx                   # 8-byte Reload
	movl	24(%rsp), %r8d                  # 4-byte Reload
	movq	40(%rsp), %rsi                  # 8-byte Reload
	movslq	%eax, %rdi
	movb	(%rsi,%rdi), %dil
	movl	%eax, %esi
	addl	%r8d, %esi
	movslq	%esi, %rsi
	movb	%dil, (%rdx,%rsi)
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, (%rsp)                    # 4-byte Spill
	je	.LBB14_6
	jmp	.LBB14_7
.Lfunc_end14:
	.size	_string.concat, .Lfunc_end14-_string.concat
                                        # -- End function
	.globl	_string.copy                    # -- Begin function _string.copy
	.p2align	4, 0x90
	.type	_string.copy,@function
_string.copy:                           # @_string.copy
.L_string.copy$local:
# %bb.0:
	subq	$40, %rsp
	movq	%rdi, 24(%rsp)                  # 8-byte Spill
	xorl	%eax, %eax
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	jmp	.LBB15_1
.LBB15_1:                               # =>This Inner Loop Header: Depth=1
	movl	36(%rsp), %eax                  # 4-byte Reload
	movq	24(%rsp), %rcx                  # 8-byte Reload
	movl	%eax, 16(%rsp)                  # 4-byte Spill
	movslq	%eax, %rdx
	movb	(%rcx,%rdx), %cl
	addl	$1, %eax
	movl	%eax, 20(%rsp)                  # 4-byte Spill
	cmpb	$0, %cl
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	jne	.LBB15_1
# %bb.2:
	movl	20(%rsp), %edi                  # 4-byte Reload
	callq	malloc
	movl	16(%rsp), %ecx                  # 4-byte Reload
	movq	%rax, (%rsp)                    # 8-byte Spill
	xorl	%eax, %eax
	cmpl	$0, %ecx
	movl	%eax, 12(%rsp)                  # 4-byte Spill
	jne	.LBB15_4
.LBB15_3:
	movq	(%rsp), %rax                    # 8-byte Reload
	movl	16(%rsp), %ecx                  # 4-byte Reload
	movslq	%ecx, %rcx
	movb	$0, (%rax,%rcx)
	addq	$40, %rsp
	retq
.LBB15_4:                               # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax                  # 4-byte Reload
	movl	16(%rsp), %ecx                  # 4-byte Reload
	movq	(%rsp), %rdx                    # 8-byte Reload
	movq	24(%rsp), %rsi                  # 8-byte Reload
	movslq	%eax, %rdi
	movb	(%rsi,%rdi), %dil
	movslq	%eax, %rsi
	movslq	%eax, %r8
	movb	%dil, (%rdx,%rsi)
	addl	$1, %eax
	cmpl	%ecx, %eax
	movl	%eax, 12(%rsp)                  # 4-byte Spill
	je	.LBB15_3
	jmp	.LBB15_4
.Lfunc_end15:
	.size	_string.copy, .Lfunc_end15-_string.copy
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%s\n"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

	.ident	"Ubuntu clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
