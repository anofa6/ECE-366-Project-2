.data
    m:          .word 45
    result:     .word 0

.text
main:
    # Load m
    lw $t0, m
    # set $t1 to 2
    li $t1, 2
repeated_sub:
    # jumps if m is less than 2
    blt  $t0, $t1, check
    # sets m($t0) to m-2
    sub  $t0, $t0, $t1
    # jumps to repeat loop
    j    repeated_sub
check:
    # checks if remainder ($t0) is 0, m is EVEN -> return 0 (False)
    beq $t0, $zero, return_false
    # returns 1 for true
    li $t2, 1
    j done
return_false:
    # returns o for true
    li $t2, 0
done:
    #stores result to memory
    sw $t2, result

    # terminate program
	li $v0, 10
	syscall