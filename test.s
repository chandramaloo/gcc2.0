	.data
L0:	.asciiz	"\n"
	.text

main:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp

# space for local variables
	addi $sp, $sp, -4

	addi $t2, $0, 0
	addi $t0, $fp, -4
	#df
	move $t3, $t0
	move $t0, $t3
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	li.s $f2, 1.5
# operating to produce a float
	mov.s $f1, $f2
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	mov.s $f2, $f0
	addi $t0, $fp, -4
	#df
	move $t2, $t0
	move $t0, $t2
	mov.s $f2, $f0
	s.s $f0, 0($t0)
# printf prints a float identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	l.s $f12, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 2
	syscall
# printf prints a string const
	la $a0, L0
	addi $v0, $0, 4
	syscall


mainReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

