	.data
L0:	.asciiz	"\n"
L1:	.asciiz	"\n"
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
	addi $t2, $0, 2
#Identifier
	addi $t0, $fp, -4
	move $t3, $t0
	move $t0, $t3
	sw $t2, 0($t0)
#Assign
#FloatConst
	li.s $f2, 2.3
#Identifier
	addi $t0, $fp, -8
	move $t4, $t0
	move $t0, $t4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Funcall
# printf prints a float identifier
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

	l.s $f12, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 2
	syscall
# printf prints an int identifier
#Identifier
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
#Funcall
# printf prints an int identifier
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
# printf prints a float identifier
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

	l.s $f12, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 2
	syscall
# printf prints a string const
	la $a0, L1
	addi $v0, $0, 4
	syscall


mainReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

