	.data
L0:	.asciiz	"\n"
	.text

binary:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp
	addi $sp, $sp, -4
	lw $s0, 20($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 16($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	add $s0, $s0, $s1
	sw $s0, 0($sp)

	addi $s0, $fp, -4
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, 0($s0)

	lw $s0, -4($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $0, 2
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	div $s0, $s0, $s1
	sw $s0, 0($sp)

	addi $s0, $fp, -4
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, 0($s0)

#param array found
	lw $s0, 8($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, -4($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

# found offset to be 4
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $s2, $0, -4
	mul $s1, $s1, $s2
	add $s0, $s0, $s1
# struct_width found to be 4
	addi $sp, $sp, 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $s0, 12($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	seq $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	beq $s0, $0, L1
	lw $s0, -4($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

# struct_width found to be 4
	lw $s1, 0($sp)
	sw $s1, 24($fp)

	j binaryReturn


	j L2
L1:
	lw $s0, 20($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 16($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	seq $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	beq $s0, $0, L3
	addi $s0, $0, 1
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	neg $s0, $s0
	sw $s0, 0($sp)

# struct_width found to be 4
	lw $s1, 0($sp)
	sw $s1, 24($fp)

	j binaryReturn


	j L4
L3:
#param array found
	lw $s0, 8($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, -4($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

# found offset to be 4
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $s2, $0, -4
	mul $s1, $s1, $s2
	add $s0, $s0, $s1
# struct_width found to be 4
	addi $sp, $sp, 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $s0, 12($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	slt $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	beq $s0, $0, L5
	addi $sp, $sp, -4
	lw $s0, -4($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 16($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 12($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $fp, 8
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	jal binary
	addi $sp, $sp, 16

# struct_width found to be 4
	lw $s1, 0($sp)
	sw $s1, 24($fp)

	j binaryReturn


	j L6
L5:
	addi $sp, $sp, -4
	lw $s0, 20($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, -4($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 12($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $fp, 8
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	jal binary
	addi $sp, $sp, 16

# struct_width found to be 4
	lw $s1, 0($sp)
	sw $s1, 24($fp)

	j binaryReturn


L6:


L4:


L2:



binaryReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

main:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp
	addi $sp, $sp, -44
	addi $s0, $0, 0
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $fp, -44
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, 0($s0)

L7:
	lw $s0, -44($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $0, 10
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	slt $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
	beq $s0, $0, L8
	lw $s0, -44($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, -44($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	mul $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, -44($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 4($sp)
	lw $s1 0($sp)
	addi $sp, $sp, 4
	mul $s0, $s0, $s1
	sw $s0, 0($sp)

#local array found
	addi $s0, $fp, -4
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, -44($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

# found offset to be 4
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $s2, $0, -4
	mul $s1, $s1, $s2
	add $s0, $s0, $s1
	addi $sp, $sp, 4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, 0($s0)


	addi $s0, $fp, -44
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	lw $s1, 0($s0)
	addi $s2, $s1, 1
	sw $s2, 0($s0)
	sw $s2, 0($sp)

	j L7
L8:

	addi $sp, $sp, -4
	addi $s0, $0, 0
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $0, 10
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $0, 27
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $fp, -4
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	jal binary
	addi $sp, $sp, 16

	addi $s0, $fp, -44
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, 0($s0)

# printf prints an int identifier
	lw $s0, -44($fp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
	la $a0, L0
	addi $v0, $0, 4
	syscall


mainReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

