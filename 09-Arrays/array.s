        .data
prompt: .asciiz "Enter value at index "
colon:  .asciiz ": "

        # .align 2
array:  .space 80

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

        li $v0, 5           # read int into $t1
        syscall

        sw $v0, 0($t1)      # store $v0 (input) in array

        addi $t0, $t0, 1    # increment index
        addi $t1, $t1, 4    # increment array address

        j loop


exit:
        li $v0, 10
        syscall
