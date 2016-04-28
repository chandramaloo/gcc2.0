	.data
	.text

fn:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	move $fp, $sp

# space for local variables
	addi $sp, $sp, -0

#Seq
#Return
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, 16($fp)
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
	mul $t0, $t0, $t1
	move $t2, $t0
#Identifier
	addi $sp, $sp, -4
	lw $t1, 8($fp)
	sw $t1, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	move $t0, $t2
# operating to produce an integer
	mul $t0, $t0, $t1
	move $t2, $t0
	sw $t2, 20($fp)
	j fnReturn



fnReturn:
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
	addi $sp, $sp, -44

#Seq
#Assign
#IntConst
	addi $t2, $0, 14
#Identifier
	addi $t0, $fp, -4
	move $t3, $t0
	move $t0, $t3
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 17
#Identifier
	addi $t0, $fp, -8
	move $t4, $t0
	move $t0, $t4
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 2
#Identifier
	addi $t0, $fp, -12
	move $t5, $t0
	move $t0, $t5
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 7
#Identifier
	addi $t0, $fp, -16
	move $t6, $t0
	move $t0, $t6
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 9
#Identifier
	addi $t0, $fp, -20
	move $t7, $t0
	move $t0, $t7
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 16
#Identifier
	addi $t0, $fp, -24
	move $t8, $t0
	move $t0, $t8
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 18
#Identifier
	addi $t0, $fp, -28
	move $t9, $t0
	move $t0, $t9
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 18
#Identifier
	addi $t0, $fp, -32
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 20
#Identifier
	addi $t0, $fp, -36
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 13
#Identifier
	addi $t0, $fp, -40
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#IntConst
	addi $t2, $0, 7
#Identifier
	addi $t0, $fp, -44
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t0, 0($sp)
	addi $sp, $sp, 4
	mtc1 $t2, $f0

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Assign
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f2, $f0
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f3, $f0
# operating to produce a float
	mov.s $f1, $f3
	mov.s $f0, $f2
	c.lt.s $f0, $f1
	bc1t L4
	move $t2, $0
	j L5
L4:
	addi $t2, $0, 1
L5:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	mtc1 $t2, $f0
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sub $t0, $t0, $t1
	move $t2, $t0
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L8
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L9
L8:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L9:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	move $t0, $t2
# operating to produce an integer
	sub $t0, $t0, $t1
	move $t2, $t0
# operating to produce a float
	mtc1 $t2, $f1
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L10
	move $t2, $0
	j L11
L10:
	addi $t2, $0, 1
L11:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	mtc1 $t2, $f0
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L12
	move $t2, $0
	j L13
L12:
	addi $t2, $0, 1
L13:
# operating to produce a float
	mtc1 $t2, $f1
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f2, $f0
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f3, $f0
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f3
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f3, $f0
# operating to produce a float
	mov.s $f1, $f3
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L20
	move $t2, $0
	j L21
L20:
	addi $t2, $0, 1
L21:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f3, $f0
# operating to produce a float
	mov.s $f1, $f3
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f3, $f0
# operating to produce a float
	mov.s $f1, $f3
	mtc1 $t2, $f0
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L26
	move $t2, $0
	j L27
L26:
	addi $t2, $0, 1
L27:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L28
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L29
L28:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L29:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L30
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L31
L30:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L31:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L32
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L33
L32:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L33:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L36
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L37
L36:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L37:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L38
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L39
L38:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L39:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f3, $f0
# operating to produce a float
	mov.s $f1, $f3
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L46
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L47
L46:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L47:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f3, $f0
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f4, $f0
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L54
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L55
L54:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L55:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L58
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L59
L58:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L59:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f5, $f0
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f6, $f0
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L64
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L65
L64:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L65:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f7, $f0
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f8, $f0
# operating to produce a float
	mov.s $f1, $f8
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L72
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L73
L72:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L73:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L74
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L75
L74:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L75:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L76
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L77
L76:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L77:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f8, $f0
# operating to produce a float
	mov.s $f1, $f8
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f8, $f0
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	mov.s $f0, $f8
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f8, $f0
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f9, $f0
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L100
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L101
L100:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L101:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L102
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L103
L102:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L103:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L104
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L105
L104:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L105:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L106
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L107
L106:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L107:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L108
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L109
L108:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L109:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L112
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L113
L112:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L113:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L116
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L117
L116:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L117:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L122
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L123
L122:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L123:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L128
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L129
L128:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L129:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L132
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L133
L132:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L133:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L138
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L139
L138:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L139:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L140
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L141
L140:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L141:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L144
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L145
L144:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L145:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L146
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L147
L146:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L147:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L150
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L151
L150:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L151:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L154
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L155
L154:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L155:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L158
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L159
L158:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L159:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L160
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L161
L160:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L161:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L164
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L165
L164:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L165:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L172
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L173
L172:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L173:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L176
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L177
L176:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L177:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L186
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L187
L186:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L187:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L188
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L189
L188:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L189:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L190
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L191
L190:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L191:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L196
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L197
L196:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L197:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L202
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L203
L202:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L203:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L206
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L207
L206:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L207:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L208
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L209
L208:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L209:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L210
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L211
L210:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L211:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L212
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L213
L212:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L213:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L214
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L215
L214:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L215:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L220
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L221
L220:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L221:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L226
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L227
L226:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L227:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L228
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L229
L228:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L229:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L234
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L235
L234:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L235:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L236
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L237
L236:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L237:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L240
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L241
L240:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L241:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L246
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L247
L246:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L247:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L250
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L251
L250:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L251:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L252
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L253
L252:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L253:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L254
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L255
L254:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L255:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L256
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L257
L256:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L257:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L258
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L259
L258:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L259:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L262
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L263
L262:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L263:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L264
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L265
L264:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L265:
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L270
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L271
L270:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L271:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L272
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L273
L272:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L273:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L274
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L275
L274:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L275:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L276
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L277
L276:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L277:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L280
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L281
L280:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L281:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L282
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L283
L282:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L283:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L292
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L293
L292:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L293:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L294
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L295
L294:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L295:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L296
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L297
L296:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L297:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L302
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L303
L302:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L303:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L304
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L305
L304:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L305:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L306
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L307
L306:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L307:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L308
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L309
L308:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L309:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

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
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L320
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L321
L320:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L321:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L322
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L323
L322:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L323:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L326
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L327
L326:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L327:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L334
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L335
L334:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L335:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L336
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L337
L336:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L337:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L338
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L339
L338:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L339:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L344
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L345
L344:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L345:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L348
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L349
L348:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L349:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L350
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L351
L350:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L351:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L352
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L353
L352:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L353:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L360
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L361
L360:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L361:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L364
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L365
L364:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L365:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L370
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L371
L370:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L371:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L374
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L375
L374:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L375:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L376
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L377
L376:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L377:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
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

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L382
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L383
L382:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L383:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L386
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L387
L386:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L387:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L388
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L389
L388:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L389:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L392
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L393
L392:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L393:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L394
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L395
L394:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L395:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L402
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L403
L402:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L403:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L408
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L409
L408:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L409:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L410
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L411
L410:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L411:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L414
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L415
L414:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L415:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L416
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L417
L416:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L417:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L418
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L419
L418:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L419:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L422
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L423
L422:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L423:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L424
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L425
L424:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L425:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L440
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L441
L440:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L441:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L444
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L445
L444:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L445:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L446
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L447
L446:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L447:
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

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
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sge $t0, $t0, $t1
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

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L450
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L451
L450:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L451:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L464
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L465
L464:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L465:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L466
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L467
L466:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L467:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L468
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L469
L468:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L469:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L470
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L471
L470:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L471:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L480
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L481
L480:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L481:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L482
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L483
L482:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L483:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L486
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L487
L486:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L487:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L488
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L489
L488:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L489:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L492
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L493
L492:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L493:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L494
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L495
L494:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L495:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L496
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L497
L496:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L497:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L498
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L499
L498:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L499:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L500
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L501
L500:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L501:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L502
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L503
L502:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L503:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L504
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L505
L504:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L505:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L506
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L507
L506:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L507:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L508
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L509
L508:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L509:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L512
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L513
L512:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L513:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L516
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L517
L516:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L517:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L518
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L519
L518:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L519:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L522
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L523
L522:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L523:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L530
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L531
L530:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L531:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L536
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L537
L536:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L537:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L540
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L541
L540:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L541:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L544
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L545
L544:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L545:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L546
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L547
L546:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L547:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L548
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L549
L548:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L549:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L554
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L555
L554:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L555:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L558
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L559
L558:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L559:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L560
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L561
L560:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L561:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L562
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L563
L562:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L563:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L572
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L573
L572:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L573:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L574
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L575
L574:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L575:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L578
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L579
L578:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L579:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L584
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L585
L584:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L585:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L586
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L587
L586:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L587:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L588
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L589
L588:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L589:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L592
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L593
L592:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L593:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L594
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L595
L594:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L595:
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
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

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L596
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L597
L596:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L597:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L600
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L601
L600:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L601:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L602
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L603
L602:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L603:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L604
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L605
L604:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L605:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L606
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L607
L606:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L607:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sgt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L614
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L615
L614:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L615:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L624
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L625
L624:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L625:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L626
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L627
L626:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L627:
#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L630
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L631
L630:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L631:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L632
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L633
L632:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L633:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L634
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L635
L634:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L635:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L636
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L637
L636:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L637:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L648
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L649
L648:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L649:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L652
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L653
L652:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L653:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L662
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L663
L662:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L663:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L674
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L675
L674:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L675:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L676
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L677
L676:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L677:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L678
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L679
L678:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L679:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L682
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L683
L682:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L683:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L686
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L687
L686:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L687:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

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
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L706
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L707
L706:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L707:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L708
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L709
L708:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L709:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L710
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L711
L710:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L711:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L714
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L715
L714:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L715:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L718
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L719
L718:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L719:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L724
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L725
L724:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L725:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sgt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L728
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L729
L728:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L729:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L730
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L731
L730:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L731:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L736
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L737
L736:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L737:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L740
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L741
L740:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L741:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L744
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L745
L744:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L745:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L746
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L747
L746:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L747:
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L748
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L749
L748:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L749:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L756
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L757
L756:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L757:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L758
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L759
L758:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L759:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L760
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L761
L760:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L761:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L764
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L765
L764:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L765:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L766
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L767
L766:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L767:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L770
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L771
L770:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L771:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L772
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L773
L772:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L773:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L774
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L775
L774:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L775:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L778
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L779
L778:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L779:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L786
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L787
L786:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L787:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sge $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L788
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L789
L788:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L789:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L790
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L791
L790:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L791:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L792
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L793
L792:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L793:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L794
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L795
L794:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L795:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L796
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L797
L796:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L797:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L798
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L799
L798:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L799:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L804
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L805
L804:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L805:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L806
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L807
L806:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L807:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L808
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L809
L808:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L809:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L816
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L817
L816:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L817:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L818
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L819
L818:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L819:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L820
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L821
L820:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L821:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
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

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L822
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L823
L822:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L823:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L824
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L825
L824:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L825:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sge $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L826
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L827
L826:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L827:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L828
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L829
L828:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L829:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L832
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L833
L832:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L833:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L834
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L835
L834:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L835:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sgt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L836
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L837
L836:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L837:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L840
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L841
L840:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L841:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L842
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L843
L842:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L843:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L850
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L851
L850:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L851:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L858
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L859
L858:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L859:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L860
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L861
L860:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L861:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L862
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L863
L862:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L863:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sgt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L882
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L883
L882:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L883:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L888
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L889
L888:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L889:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L890
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L891
L890:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L891:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L894
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L895
L894:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L895:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L904
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L905
L904:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L905:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L906
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L907
L906:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L907:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
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

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L912
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L913
L912:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L913:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L914
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L915
L914:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L915:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L916
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L917
L916:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L917:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L918
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L919
L918:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L919:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L920
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L921
L920:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L921:
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L922
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L923
L922:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L923:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L930
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L931
L930:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L931:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L932
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L933
L932:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L933:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L936
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L937
L936:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L937:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L946
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L947
L946:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L947:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L948
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L949
L948:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L949:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L956
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L957
L956:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L957:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L960
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L961
L960:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L961:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L962
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L963
L962:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L963:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L964
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L965
L964:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L965:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L970
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L971
L970:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L971:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L972
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L973
L972:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L973:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L976
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L977
L976:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L977:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L978
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L979
L978:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L979:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L980
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L981
L980:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L981:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L982
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L983
L982:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L983:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L986
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L987
L986:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L987:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L988
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L989
L988:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L989:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L996
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L997
L996:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L997:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L998
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L999
L998:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L999:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	mul $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1002
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1003
L1002:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1003:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1004
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1005
L1004:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1005:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1006
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1007
L1006:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1007:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1008
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1009
L1008:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1009:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1012
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1013
L1012:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1013:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1016
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1017
L1016:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1017:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1026
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1027
L1026:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1027:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1028
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1029
L1028:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1029:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1030
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1031
L1030:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1031:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1032
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1033
L1032:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1033:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1036
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1037
L1036:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1037:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1038
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1039
L1038:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1039:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1042
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1043
L1042:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1043:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1050
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1051
L1050:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1051:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1056
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1057
L1056:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1057:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1058
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1059
L1058:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1059:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1060
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1061
L1060:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1061:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1066
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1067
L1066:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1067:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	mul $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1068
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1069
L1068:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1069:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1072
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1073
L1072:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1073:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1074
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1075
L1074:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1075:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	mul $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1082
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1083
L1082:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1083:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1084
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1085
L1084:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1085:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1086
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1087
L1086:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1087:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1088
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1089
L1088:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1089:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1090
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1091
L1090:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1091:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1114
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1115
L1114:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1115:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1122
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1123
L1122:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1123:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1128
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1129
L1128:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1129:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1138
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1139
L1138:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1139:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1140
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1141
L1140:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1141:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1142
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1143
L1142:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1143:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1146
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1147
L1146:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1147:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1148
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1149
L1148:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1149:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1150
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1151
L1150:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1151:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1152
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1153
L1152:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1153:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1154
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1155
L1154:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1155:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1158
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1159
L1158:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1159:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sgt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1164
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1165
L1164:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1165:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1166
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1167
L1166:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1167:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1170
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1171
L1170:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1171:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1172
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1173
L1172:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1173:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1174
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1175
L1174:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1175:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1184
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1185
L1184:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1185:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1188
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1189
L1188:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1189:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1190
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1191
L1190:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1191:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1192
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1193
L1192:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1193:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1194
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1195
L1194:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1195:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1200
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1201
L1200:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1201:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sge $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1206
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1207
L1206:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1207:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1212
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1213
L1212:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1213:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1226
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1227
L1226:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1227:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1240
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1241
L1240:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1241:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1244
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1245
L1244:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1245:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
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

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1252
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1253
L1252:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1253:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
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

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sub $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1258
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1259
L1258:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1259:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1262
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1263
L1262:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1263:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1266
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1267
L1266:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1267:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1270
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1271
L1270:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1271:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1278
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1279
L1278:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1279:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1280
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1281
L1280:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1281:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1288
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1289
L1288:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1289:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1300
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1301
L1300:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1301:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1302
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1303
L1302:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1303:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1306
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1307
L1306:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1307:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1312
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1313
L1312:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1313:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1316
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1317
L1316:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1317:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1318
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1319
L1318:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1319:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	mul $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1320
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1321
L1320:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1321:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1322
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1323
L1322:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1323:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1324
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1325
L1324:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1325:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1330
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1331
L1330:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1331:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1332
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1333
L1332:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1333:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1334
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1335
L1334:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1335:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1338
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1339
L1338:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1339:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1340
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1341
L1340:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1341:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1342
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1343
L1342:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1343:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1344
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1345
L1344:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1345:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1346
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1347
L1346:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1347:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1348
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1349
L1348:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1349:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
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

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1350
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1351
L1350:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1351:
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sge $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1354
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1355
L1354:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1355:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1380
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1381
L1380:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1381:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1386
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1387
L1386:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1387:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1392
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1393
L1392:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1393:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1394
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1395
L1394:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1395:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1396
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1397
L1396:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1397:
#OpBinary
#OpBinary
#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1408
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1409
L1408:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1409:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	add $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#Funcall
	addi $sp, $sp, -4
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

	jal fn
	addi $sp, $sp, 12

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	seq $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1424
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1425
L1424:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1425:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1426
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1427
L1426:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1427:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1428
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1429
L1428:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1429:
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1436
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1437
L1436:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1437:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1446
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1447
L1446:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1447:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1448
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1449
L1448:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1449:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1460
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1461
L1460:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1461:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1462
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1463
L1462:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1463:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1466
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1467
L1466:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1467:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1474
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1475
L1474:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1475:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1478
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1479
L1478:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1479:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1486
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1487
L1486:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1487:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -12($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1494
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1495
L1494:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1495:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1496
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1497
L1496:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1497:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sle $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1500
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1501
L1500:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1501:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1502
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1503
L1502:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1503:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1504
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1505
L1504:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1505:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1508
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1509
L1508:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1509:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1510
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1511
L1510:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1511:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1512
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1513
L1512:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1513:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1516
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1517
L1516:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1517:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1522
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1523
L1522:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1523:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1532
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1533
L1532:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1533:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1534
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1535
L1534:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1535:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -16($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1536
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1537
L1536:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1537:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1538
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1539
L1538:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1539:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1544
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1545
L1544:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1545:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1546
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1547
L1546:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1547:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1548
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1549
L1548:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1549:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -20($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1552
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1553
L1552:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1553:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -8($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1556
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1557
L1556:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1557:
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -40($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1560
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1561
L1560:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1561:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1562
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1563
L1562:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1563:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1566
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1567
L1566:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1567:
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -36($fp)
	sw $t1, 0($sp)

#OpBinary
#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -32($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1570
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1571
L1570:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1571:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -24($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f1, $f0
	bc1t L1572
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1573
L1572:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1573:
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1574
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1575
L1574:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1575:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -44($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

#OpBinary
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1582
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1583
L1582:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1583:
#OpBinary
#Identifier
	addi $sp, $sp, -4
	lw $t1, -28($fp)
	sw $t1, 0($sp)

#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sgt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

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
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1590
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1591
L1590:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1591:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1598
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1599
L1598:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1599:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1600
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1601
L1600:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1601:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1608
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1609
L1608:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1609:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1618
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1619
L1618:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1619:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1624
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1625
L1624:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1625:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f1, $f0
	bc1t L1628
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1629
L1628:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1629:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1638
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1639
L1638:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1639:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1640
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1641
L1640:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1641:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1642
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1643
L1642:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1643:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1658
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1659
L1658:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1659:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1662
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1663
L1662:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1663:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1668
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1669
L1668:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1669:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sgt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1686
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1687
L1686:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1687:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1690
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1691
L1690:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1691:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1692
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1693
L1692:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1693:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1694
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1695
L1694:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1695:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sge $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	c.lt.s $f0, $f1
	bc1t L1698
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1699
L1698:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1699:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1702
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1703
L1702:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1703:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1706
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1707
L1706:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1707:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1708
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1709
L1708:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1709:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1710
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1711
L1710:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1711:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f0, $f1
	bc1t L1712
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1713
L1712:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1713:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1716
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1717
L1716:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1717:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1722
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1723
L1722:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1723:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1724
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1725
L1724:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1725:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	mov.s $f0, $f9
	c.lt.s $f0, $f1
	bc1t L1726
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1727
L1726:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1727:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1728
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1729
L1728:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1729:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1732
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1733
L1732:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1733:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	mov.s $f0, $f8
	sub.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f8, $f0
# operating to produce a float
	mov.s $f1, $f8
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f8, $f0
# operating to produce a float
	mov.s $f1, $f8
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f8, $f0
# operating to produce a float
	mov.s $f1, $f8
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f8, $f0
# operating to produce a float
	mov.s $f1, $f8
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f8, $f0
# operating to produce a float
	mov.s $f1, $f8
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1748
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1749
L1748:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1749:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	and $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	mov.s $f0, $f7
	sub.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f7, $f0
# operating to produce a float
	mov.s $f1, $f7
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	or $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	mov.s $f0, $f6
	c.lt.s $f0, $f1
	bc1t L1756
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1757
L1756:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1757:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	mov.s $f0, $f5
	c.lt.s $f0, $f1
	bc1t L1758
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1759
L1758:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1759:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1760
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1761
L1760:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1761:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	sub.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f5, $f0
# operating to produce a float
	mov.s $f1, $f5
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f0, $f0
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	mov.s $f0, $f4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f4, $f0
# operating to produce a float
	mov.s $f1, $f4
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1770
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1771
L1770:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1771:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	mov.s $f0, $f3
	c.lt.s $f0, $f1
	bc1t L1774
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1775
L1774:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1775:
	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	slt $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1776
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1777
L1776:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1777:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f1, $f0
	bc1t L1778
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1779
L1778:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1779:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	seq $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	or $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	lw $t1 0($sp)
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# operating to produce an integer
	sge $t0, $t0, $t1
	addi $sp, $sp, -4
	sw $t0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.le.s $f1, $f0
	bc1t L1784
	addi $sp, $sp, -4
	sw $0, 0($sp)
	j L1785
L1784:
	addi $t0, $0, 1
	addi $sp, $sp, -4
	sw $t0, 0($sp)
L1785:
# operating to produce a float
	l.s $f1, 0($sp)
	addi $sp, $sp, 4
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f3, $f0
# operating to produce a float
	mov.s $f1, $f3
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	add.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f3, $f0
# operating to produce a float
	mov.s $f1, $f3
	mtc1 $t2, $f0
	cvt.s.w $f0, $f0
	c.le.s $f0, $f1
	bc1t L1790
	move $t2, $0
	j L1791
L1790:
	addi $t2, $0, 1
L1791:
# operating to produce a float
	mtc1 $t2, $f1
	cvt.s.w $f1, $f1
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	c.lt.s $f0, $f1
	bc1t L1792
	move $t2, $0
	j L1793
L1792:
	addi $t2, $0, 1
L1793:
# operating to produce a float
	mtc1 $t2, $f1
	cvt.s.w $f1, $f1
	mov.s $f0, $f2
	sub.s $f0, $f0, $f1
# floatfloatint 
	mov.s $f2, $f0
# operating to produce a float
	mov.s $f1, $f2
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mul.s $f0, $f0, $f1
# floatfloatfloat 
	mov.s $f2, $f0
# operating to produce a float
	mov.s $f1, $f2
	l.s $f0, 0($sp)
	addi $sp, $sp, 4
	mfc1 $t0, $f0
	mfc1 $t1, $f1
	and $t0, $t0, $t1
	mtc1 $t0, $f0
	addi $sp, $sp, -4
	s.s $f0, 0($sp)

#Identifier
	addi $t0, $fp, -4
	move $t2, $t0
	move $t0, $t2
	l.s $f0, 0($sp)
	addi $sp, $sp, 4

	cvt.s.w $f0, $f0
	s.s $f0, 0($t0)
#Funcall
# printf prints a float identifier
#Identifier
	addi $sp, $sp, -4
	lw $t1, -4($fp)
	sw $t1, 0($sp)

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

