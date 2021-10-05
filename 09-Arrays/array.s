        .data
prompt: .asciiz "Enter value at index "
colon:  .asciiz ": "
msg1:   .asciiz "\nPrinting Values...\n"
msg2:   .asciiz "\nDone!"
nl:     .asciiz "\n"

        .align 2            # if you don't align, it will cause error
                            # .align n
                            #   - aligns to the next byte that can be divided by
                            #       2^n
                            #
                            # In this case, we align to the next 2^2 = 4 bytes
                            #   Remember, 4 bytes is the size of a word

array:  .space 20           # We want to store 5 integers
                            # Every integer is the size of a word (4 bytes)
                            # 5 integers * 4 bytes/integer = 20 bytes
                            # Thus, we need 80 bytes of space for our array

        .text
        .globl main
main:
                            # initialize loop values
        li $t0, 0           # $t0 = index
        la $t1, array       # $t1 = array address
        li $s0, 5           # $s0 = loop limit

loop1:                      # loop to read inputs
        bge $t0, $s0, print # loop while $t0 < $s0, while not $t0 >= $s0

        li $v0, 4           # print out the prompt
        la $a0, prompt
        syscall

        li $v0, 1           # print out index ($t0)
        add $a0, $t0, $0
        syscall

        li $v0, 4           # print out the colon and space for prompt
        la $a0, colon
        syscall

        li $v0, 5           # read int into $v0
        syscall

        sw $v0, 0($t1)      # store $v0's value (the input) in array

        addi $t0, $t0, 1    # increment index
        addi $t1, $t1, 4    # increment array address

        j loop1

print:
                            # initialize loop values
        li $t0, 0           # $t0 = index
        la $t1, array       # $t1 = array address
        li $s0, 5           # $s0 = loop limit

        li $v0, 4
        la $a0, msg1
        syscall

loop2:                      # loop to print array contents
        bge $t0, $s0, exit  # loop while $t0 < $s0, while not $t0 >= $s0

        li $v0, 1           # print out the integer
        lw $a0, 0($t1)      # get the word from the array
        syscall

        li $v0, 4           # print out newline character
        la $a0, nl
        syscall

        addi $t0, $t0, 1    # increment index
        addi $t1, $t1, 4    # increment array address

        j loop2

exit:
        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 10          # gracefully exit
        syscall
