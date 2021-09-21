      .data
prmt: .asciiz "Show me a number: "
msgg: .asciiz "The lucky number is greater than that!"
msgl: .asciiz "The lucky number is less than that!"
msge: .asciiz "You guesssed the lucky number!"

      .text
      .globl main

main:
                          # save the lucky number
      li $s0, 7

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
                          # if we haven't branched yet, $s0 == $v0
      la $a0, msge        # load equal message
      j end               # jump to end

great:                    # load greater message and jump to 'end'
      la $a0, msgg
      j end

less:                     # load greater message and jump to 'end'
      la $a0, msgl
      j end

end:                      # carry out final step: syscall to print string
      li $v0, 4
      syscall

exit:                     # gracefully exit
      li $v0, 10
      syscall
