	.data
L0:	.asciiz	":"
L1:	.asciiz	"\n"
L2:	.asciiz	"\n"
L3:	.asciiz	"\n"
L4:	.asciiz	"Given array is \n"
L5:	.asciiz	"\nSorted array is \n"
	.text

merge:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp

# space for local variables
	addi $sp, $sp, -900

#Seq
#Assign
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 16($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sub $t0, $t0, $t1
	move $t2, $t0
#IntConst
	addi $t3, $0, 1
	move $t1, $t3
	move $t0, $t2
# operating to produce an integer
	add $t0, $t0, $t1
	move $t2, $t0
#Identifier
	addi $t0, $fp, -16
	move $t3, $t0
	move $t0, $t3
	sw $t2, 0($t0)
#Assign
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sub $t0, $t0, $t1
	move $t4, $t0
#Identifier
	addi $t0, $fp, -20
	move $t5, $t0
	move $t0, $t5
	sw $t4, 0($t0)
#For
#Assign
#IntConst
	addi $t6, $0, 0
#Identifier
	addi $t0, $fp, -4
	move $t7, $t0
	move $t0, $t7
	sw $t6, 0($t0)
L6:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	move $t8, $t0
	move $t0, $t8
	beq $t0, $0, L7
#Seq
#Assign
#Member
#ArrayRef
#Identifier
	addi $sp, $sp, -4
	lw $t1, 20($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	add $t0, $t0, $t1
	move $t8, $t0
	addi $t0, $0, -44
	move $t1, $t8
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -24
	move $t8, $t0
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	move $t0, $t8
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	move $t9, $t0
	move $t0, $t9
	mov.s $f0, $f2
	s.s $f0, 0($t0)

#OpUnary
#Identifier
	addi $t0, $fp, -4
	move $t9, $t0
	move $t0, $t9
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	j L6
L7:

#For
#Assign
#IntConst
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $t0, $fp, -8
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)

L8:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	beq $t0, $0, L9
#Seq
#Assign
#Member
#ArrayRef
#Identifier
	addi $sp, $sp, -4
	lw $t1, 20($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#IntConst
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -464
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)

#OpUnary
#Identifier
	addi $t0, $fp, -8
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	j L8
L9:

#Assign
#IntConst
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)

#Assign
#IntConst
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $t0, $fp, -8
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)

#Assign
#Identifier
	addi $sp, $sp, -4
	lw $t1, 16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $t0, $fp, -12
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)

#While
L10:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	beq $t0, $0, L11
#Seq
#If
#OpBinary
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -24
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -464
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f3, 0($t0)
# operating to produce a float
	mov.s $f1, $f3
	mov.s $f0, $f2
	c.le.s $f0, $f1
	bc1t L12
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L13
L12:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L13:
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	beq $t0, $0, L14
#Seq
#Assign
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -24
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
#Member
#ArrayRef
#Identifier
	addi $sp, $sp, -4
	lw $t1, 20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#OpUnary
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)

	j L15
L14:
#Seq
#Assign
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -464
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
#Member
#ArrayRef
#Identifier
	addi $sp, $sp, -4
	lw $t1, 20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#OpUnary
#Identifier
	addi $t0, $fp, -8
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)

L15:

#OpUnary
#Identifier
	addi $t0, $fp, -12
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)

	j L10
L11:

#While
L16:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	beq $t0, $0, L17
#Seq
#Assign
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -24
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
#Member
#ArrayRef
#Identifier
	addi $sp, $sp, -4
	lw $t1, 20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#OpUnary
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
#OpUnary
#Identifier
	addi $t0, $fp, -12
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)

	j L16
L17:

#While
L18:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	beq $t0, $0, L19
#Seq
#Assign
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -464
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
#Member
#ArrayRef
#Identifier
	addi $sp, $sp, -4
	lw $t1, 20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#OpUnary
#Identifier
	addi $t0, $fp, -8
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
#OpUnary
#Identifier
	addi $t0, $fp, -12
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)

	j L18
L19:



mergeReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

mergeSort:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp

# space for local variables
	addi $sp, $sp, -4

#Seq
#If
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 8($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	beq $t0, $0, L20
#Seq
#Assign
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sub $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 2
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	div $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)

#Funcall
	addi $sp, $sp, 0
#Identifier
	addi $sp, $sp, -4
	lw $t1, 16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	jal mergeSort
	addi $sp, $sp, 12

#Funcall
	addi $sp, $sp, 0
#Identifier
	addi $sp, $sp, -4
	lw $t1, 16($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#IntConst
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 8($fp)
	sw $t1, 0($sp)

	jal mergeSort
	addi $sp, $sp, 12

#Funcall
	addi $sp, $sp, 0
#Identifier
	addi $sp, $sp, -4
	lw $t1, 16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 8($fp)
	sw $t1, 0($sp)

	jal merge
	addi $sp, $sp, 16


	j L21
L20:
#Seq
#Assign
#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $t0, $fp, 12
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)


L21:



mergeSortReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

printArray:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp

# space for local variables
	addi $sp, $sp, -4

#Seq
#For
#Assign
#IntConst
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)

L22:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, 8($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	beq $t0, $0, L23
#Seq
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
# printf prints a string const
	la $a0, L0
	addi $v0, $0, 4
	syscall
# printf prints an expression
#Member
#ArrayRef
#Identifier
	addi $sp, $sp, -4
	lw $t1, 12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
	mov.s $f12, $f2
	addi $v0, $0, 2
	syscall
# printf prints a string const
	la $a0, L1
	addi $v0, $0, 4
	syscall

#OpUnary
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($t0)
	addi $t1, $t1, 1
	sw $t1, 0($t0)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	j L22
L23:

#Funcall
# printf prints a string const
	la $a0, L2
	addi $v0, $0, 4
	syscall


printArrayReturn:
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

# space for local variables
	addi $sp, $sp, -444

#Seq
#Assign
#IntConst
	addi $t0, $0, 10
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $t0, $fp, -444
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	sw $t1, 0($t0)

#Assign
#FloatConst
	li.s $f2, 1.1
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 21.1
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 1.12
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 2
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 1.11
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 3
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 11.1
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 1.1
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 5
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 11.1
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 6
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 122.1
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 7
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 12.1
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 8
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Assign
#FloatConst
	li.s $f2, 1.12
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 9
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f2
	s.s $f0, 0($t0)
#Funcall
# printf prints an expression
#Member
#ArrayRef
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 9
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	addi $t0, $0, -44
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	mul $t1, $t1, $t0
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	addi $t0, $t0,0
#AAAfloat
	l.s $f2, 0($t0)
	mov.s $f12, $f2
	addi $v0, $0, 2
	syscall
# printf prints a string const
	la $a0, L3
	addi $v0, $0, 4
	syscall
#Funcall
# printf prints a string const
	la $a0, L4
	addi $v0, $0, 4
	syscall
#Funcall
	addi $sp, $sp, 0
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -444($fp)
	sw $t1, 0($sp)

	jal printArray
	addi $sp, $sp, 8

#Funcall
	addi $sp, $sp, 0
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#IntConst
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -444($fp)
	sw $t1, 0($sp)

#IntConst
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sub $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	jal mergeSort
	addi $sp, $sp, 12

#Funcall
# printf prints a string const
	la $a0, L5
	addi $v0, $0, 4
	syscall
#Funcall
	addi $sp, $sp, 0
#Identifier
	addi $t0, $fp, -4
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -444($fp)
	sw $t1, 0($sp)

	jal printArray
	addi $sp, $sp, 8

#Return
#IntConst
	addi $t0, $0, 0
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1, 0($sp)
	sw $t1, 8($fp)

	j mainReturn



mainReturn:
	lw $ra, 4($fp)
	move $sp, $fp
	lw $fp, 0($fp)
	addi $sp, $sp, 8
	jr $ra

