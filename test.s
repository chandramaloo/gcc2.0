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

	addi $s0, $0, 20
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $fp, -4
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	cvt.s.w $f0, $f0
	s.s $f0, 0($s0)
# printf prints an expression
	lw $s0, -4($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	addi $s0, $0, 2
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, -4($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

# operating to produce a float
	l.s $f0, 4($sp)
	cvt.s.w $f0, $f0
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f0, 4($sp)
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	s.s $f0, 0($sp)

	lw $s0, -4($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	addi $s0, $0, 2
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, -4($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

# operating to produce a float
	l.s $f0, 4($sp)
	cvt.s.w $f0, $f0
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f0, 4($sp)
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f0, 4($sp)
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	s.s $f0, 0($sp)

	l.s $f12, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 2
	syscall
# printf prints a string const
	la $a0, L0
	addi $v0, $0, 4
	syscall
# printf prints a float identifier
	lw $s0, -4($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	l.s $f12, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 2
	syscall


mainReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

