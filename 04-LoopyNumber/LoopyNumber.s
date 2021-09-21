      .data
prmt: .asciiz "Show me a number: "
msgg: .asciiz "The lucky number is greater than that! Try again...\n"
msgl: .asciiz "The lucky number is less than that! Try again...\n"
msge: .asciiz "You guesssed the lucky number! Good job!"

      .text
      .globl main

main:
                          # save the lucky number
      li $s0, 7

loop:
                          # print the prompt
      li $v0, 4           # sycall code 4
      la $a0, prmt        # load address of prompt (label is prmt)
      syscall             # invoke the OS syscall

                          # read in the input
      li $v0, 5           # syscall code for for reading integer
      syscall             # after syscall, number in $v0

                          # if greater than, go to greater than branch
      bgt $s0, $v0, great # branch to 'great' if lucky number greater
      blt $s0, $v0 less   # branch to 'less' if lucky number less
      j end               # if neither branches happened, must be equal

great:                    # load greater message and jump to top of 'loop'
      li $v0, 4
      la $a0, msgg
      syscall
      j loop

less:                     # load greater message and jump to top of 'loop'
      li $v0, 4
      la $a0, msgl
      syscall
      j loop

end:                      # carry out final step: syscall to print equal message
      li $v0, 4
      la $a0, msge
      syscall

exit:                     # gracefully exit
      li $v0, 10
      syscall
