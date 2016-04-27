	.data
L0:	.asciiz	"true\n"
L1:	.asciiz	"false\n"
L2:	.asciiz	"true\n"
L3:	.asciiz	"false\n"
	.text

main:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp

# space for local variables
	addi $sp, $sp, -8

	addi $s0, $0, 0
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
	addi $s0, $0, 0
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	neg $s0, $s0
	sw $s0, 0($sp)

	addi $s0, $fp, -8
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	cvt.s.w $f0, $f0
	s.s $f0, 0($s0)
	addi $sp, $sp, -4
	lw $s1, -4($fp)
	sw $s1, 0($sp)

	addi $s0, $0, 0
	addi $sp, $sp, -4
	sw $s0, 0($sp)

# operating to produce an integer
	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	or $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	beq $s0, $0, L4
# printf prints a string const
	la $a0, L0
	addi $v0, $0, 4
	syscall
	j L5
L4:
# printf prints a string const
	la $a0, L1
	addi $v0, $0, 4
	syscall
L5:

	addi $sp, $sp, -4
	lw $s1, -8($fp)
	sw $s1, 0($sp)

	addi $s0, $0, 0
	addi $sp, $sp, -4
	sw $s0, 0($sp)

# operating to produce an integer
	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	or $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	beq $s0, $0, L6
# printf prints a string const
	la $a0, L2
	addi $v0, $0, 4
	syscall
	j L7
L6:
# printf prints a string const
	la $a0, L3
	addi $v0, $0, 4
	syscall
L7:



mainReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

