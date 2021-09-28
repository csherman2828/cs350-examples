      .data
num:  .word 10
old:  .asciiz "Old Number: "
new:  .asciiz "New Number: "
nl:   .asciiz "\n"

      .text
      .globl main
main:
                      # print old number
      li $v0, 4
      la $a0, old
      syscall

      la $t0, num     # load address of number in memory
      lw $a0, 0($t0)  # load word from memory at address $t0 into $a0 register


                        # technically we don't HAVE to load from another register
      # lw $a0, num
                        # however, this will be split into pseudo instructions
                        # you need to understand that either way, the address is
                        #     loaded to a register and the lw and sw
                        #     instructions take REGISTERS as input

                        # print integer
      li $v0, 1
      syscall

                        # print a newline
      li $v0, 4
      la $a0, nl
      syscall

                        # save new value 20 to memory where the 10 was
      li $t2, 20
      sw $t2, 0($t0)    # $t0 still has address of "num"

                        # print about new number
      li $v0, 4
      la $a0, new
      syscall

      li $v0, 1
      add $a0, $t2, $0
      syscall

                        # gracefully exit
      li $v0, 10
      syscall
