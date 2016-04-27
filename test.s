	.data
L0:	.asciiz	"\n"
L1:	.asciiz	"\n"
	.text

f:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp
	addi $sp, $sp, -0
	addi $s0, $0, 1
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 12($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	lw $s0, 0($sp)
	addi $s1, $0,0
	add $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, -0($s0)
	addi, $sp, $sp, 4

	addi $s0, $0, 2
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 12($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	lw $s0, 0($sp)
	addi $s1, $0,-4
	add $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, -0($s0)
	addi, $sp, $sp, 4

	addi $s0, $0, 3
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 12($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	lw $s0, 0($sp)
	addi $s1, $0,-8
	add $s0, $s0, $s1
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, -0($s0)
	addi, $sp, $sp, 4

	lw $s0, 12($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	addi $s0, $fp, 8
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $sp, $sp, 4
# 4 bytes to be copied due to assignment operator
	lw $s1, 0($sp)
	sw $s1, -0($s0)
	addi, $sp, $sp, 4

# printf prints an expression
	lw $s0, 8($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	lw $s0, 0($sp)
	addi $s1, $0,0
	add $s0, $s0, $s1
# struct_width found to be 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
# printf prints an expression
	lw $s0, 8($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	lw $s0, 0($sp)
	addi $s1, $0,-4
	add $s0, $s0, $s1
# struct_width found to be 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
# printf prints an expression
	lw $s0, 8($fp)
	sw $s0, -4($sp)
	addi, $sp, $sp, -4

	lw $s0, 0($sp)
	addi $s1, $0,-8
	add $s0, $s0, $s1
# struct_width found to be 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
	la $a0, L0
	addi $v0, $0, 4
	syscall


fReturn:
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
	addi $sp, $sp, -24
	addi $sp, $sp, -4
	addi $s0, $fp, -4
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	addi $s0, $fp, -16
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	jal f
	addi $sp, $sp, 8

# printf prints an expression
	addi $s0, $fp, -16
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $s1, $0,0
	add $s0, $s0, $s1
# struct_width found to be 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
# printf prints an expression
	addi $s0, $fp, -16
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $s1, $0,-4
	add $s0, $s0, $s1
# struct_width found to be 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
# printf prints an expression
	addi $s0, $fp, -16
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	addi $s1, $0,-8
	add $s0, $s0, $s1
# struct_width found to be 4
	lw $s1, 0($s0)
	sw $s1, 0($sp)

	lw $a0, 0($sp)
	addi $sp, $sp, 4
	addi $v0, $0, 1
	syscall
	la $a0, L1
	addi $v0, $0, 4
	syscall


mainReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

