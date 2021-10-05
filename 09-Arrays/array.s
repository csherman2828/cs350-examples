        .data
prompt: .asciiz "Enter value at index "
colon:  .asciiz ": "

        .align 2            # if you don't align, it will cause error
                            # .align n
                            #   - aligns to the next byte that can be divided by
                            #       2^n
                            #
                            # In this case, we align to the next 2^2 = 4 bytes
                            #   Remember, 4 bytes is the size of a word

array:  .space 80           # We want to store 20 integers
                            # Every integer is the size of a word (4 bytes)
                            # 20 integers * 4 bytes/integer = 80 bytes
                            # Thus, we need 80 bytes of space for our array

        .text
        .globl main
main:
                            # initialize loop values
        li $t0, 0           # $t0 = index
        la $t1, array       # $t1 = array address
        li $s0, 20          # $s0 = loop limit

loop:
        bge $t0, $s0, exit  # loop while $t0 < $s0, while not $t0 >= $s0

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

        j loop

exit:
        li $v0, 10          # gracefully exit
        syscall
