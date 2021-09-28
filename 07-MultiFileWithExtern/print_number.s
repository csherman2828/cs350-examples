      .data
say:  .asciiz "Your number: "

      .text
print:
                          # we can't load local data from store_name.s
      # lw $a0, num1

                          # we CAN access the external space
      la $t1, num
      lw $t0, 0($t1)

                          # the above can technically be done in one instruction
      # lw $t0, $t1       # provides word destination $t0 from address stored
                          #   at address marked by label num
                          # this would be broken up into two pseudoinstructions

                          # print number
      li $v0, 4
      la $a0, say
      syscall

      li $v0, 1
      add $a0, $t0, $0
      syscall

                          # gracefully exit
      li $v0, 10
      syscall
