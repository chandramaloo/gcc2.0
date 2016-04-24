# Compiler executable checksum: 85b6753ea3cb37034719bf12e6ba259f
    .data                
	.globl	p
	.section	.data.rel,"aw",@progbits
	.align	2
	.type	p, @object
	.size	p, 4
p:
	.word	arr
$LC0:
	.ascii	"%d \012\000" # Replace by a ordinary string"
	.text
	.align	2           # remove
	.globl	main
	.ent	main
	.type	main, @function      # remove
main:
	.set	nomips16            # remove
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8# remove
	.mask	0xc0000000,-4      # remove
	.fmask	0x00000000,0       # remove
	.set	noreorder          # remove
	.set	nomacro            # remove
	
	addiu	$sp,$sp,-40	 #,,
	sw	$31,36($sp)	 #,
	sw	$fp,32($sp)	 #,
	move	$fp,$sp	 #,
	lui	$28,%hi(__gnu_local_gp)	 #,
	addiu	$28,$28,%lo(__gnu_local_gp)	 #,,
	.cprestore	16	 #
	li	$2,5			# 0x5	 # tmp195,
	sw	$2,28($fp)	 # tmp195, i
	li	$2,1			# 0x1	 # tmp196,
	sw	$2,24($fp)	 # tmp196, fact
	b	$L2
	nop
	 #
$L3:
	lw	$3,24($fp)	 # tmp197, fact
	lw	$2,28($fp)	 # tmp198, i
	nop
	mult	$3,$2	 # tmp197, tmp198
	mflo	$2	 #, tmp199
	sw	$2,24($fp)	 # tmp199, fact
	lw	$2,28($fp)	 # tmp200, i
	nop
	addiu	$2,$2,-1	 # tmp201, tmp200,
	sw	$2,28($fp)	 # tmp201, i
$L2:
	lw	$2,28($fp)	 # tmp202, i
	nop
	bgtz	$2,$L3
	nop
############################################
# Replace the code shown below by syscall code
	 #, tmp202,
	lui	$2,%hi($LC0)	 # tmp203,
	addiu	$4,$2,%lo($LC0)	 #, tmp203,
	lw	$5,24($fp)	 #, fact
	lw	$25,%call16(printf)($28)	 # tmp204,,
	nop
	jalr	$25
	nop
	 # tmp204
############################################
	lw	$28,16($fp)	 #,
	move	$2,$0	 # D.1681,
	move	$sp,$fp	 #,
	lw	$31,36($sp)	 #,
	lw	$fp,32($sp)	 #,
	addiu	$sp,$sp,40	 #,,
	j	$31
	nop
	.set	macro             # remove
	.set	reorder           # remove
	.end	main

	.comm	arr,40,4          # replace by .space
	.ident	"GCC: (Debian 4.3.5-4) 4.3.5" #remove
