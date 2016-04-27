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


#Assign
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)


#AssEnds

#Assign
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	add $t0, $t0, $t1
	move $t2, $t0
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0 0($sp)
	addi $sp, $sp, 4
	sw $t2, 0($t0)

#AssEnds
# printf prints an int identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
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

