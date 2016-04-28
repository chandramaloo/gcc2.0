	.data
L0:	.asciiz	"\n"
	.text

main:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp

# space for local variables
	addi $sp, $sp, -8

#Seq
#Assign
#IntConst
	addi $t2, $0, 4
#Identifier
	addi $t0, $fp, -4
	move $t3, $t0
	move $t0, $t3
	sw $t2, 0($t0)
#Assign
#IntConst
	addi $t4, $0, 8
#Identifier
	addi $t0, $fp, -8
	move $t5, $t0
	move $t0, $t5
	sw $t4, 0($t0)
#Funcall
# printf prints an int identifier
	lw $s0, -4($fp)
	move $a0, $s0
	addi $v0, $0, 1
	syscall
# printf prints an int identifier
	lw $s0, -8($fp)
	move $a0, $s0
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

