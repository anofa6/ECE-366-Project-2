.data
	# Declare input and output variables
	n: .word 22
	fn: .word 0
    
.text
main:
	# Load n
	lw $t0, n
	
	# b = 0
	li $t2, 0
	
	# If n <= 1, end
	ble $t0, 1, end
	
	# a = 0
	li $t1, 0
	
	# b = b + 1 (0 + 1 = 1)
	addi $t2, $t2, 1
	
	# n = n - 1
	subi $t0, $t0, 1
loop:
	# temp = b
	move $t3, $t2
	
	# b = a + b
	add $t2, $t1, $t2
	
	# a = temp
	move $t1, $t3
	
	# n = n - 1
	subi $t0, $t0, 1
	
	# if n != 0, loop
	bnez $t0, loop
end:	
	# If n == 1, return n (b is 0)
	add $t2, $t2, $t0
	
	# store fn into memory
	sw $t2, fn
	
	# terminate program
	li $v0, 10
	syscall