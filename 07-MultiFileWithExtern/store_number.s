      .data
prmt: .asciiz "What is your number: "
num1: .word 0
      .extern num 4

      .text
      .globl main
main:
                        # print prompt
      la $a0, prmt
      li $v0, 4
      syscall

                        # read int
      li $v0, 5
      syscall

                        # store the number in memory
      sw $v0, num1

                        # store the number in global space
      sw $v0, num

                        # go to the hello file
      j print
