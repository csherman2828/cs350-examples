        .data
msg1:   .asciiz "Hello from the main procedure!\n"
msg2:   .asciiz "Hello from the print procedure!\n"
msg3:   .asciiz "Done!\n"
msg4:   .asciiz "Hello from the main procedure, again!\n"
msg5:   .asciiz "Hello from the exit procedure!\n"
prmt:   .asciiz "What number should I print to: "
nl:     .asciiz "\n"

        .text
        .globl main
main:
        li $v0, 4           # print msg1
        la $a0, msg1
        syscall

        la $a0, prmt
        syscall

        li $v0, 5           # read integer and integer into $so
        syscall
        add $s0, $v0, $0
        addi $s0, $s0, 1    # to include the last number

        jal print           # jump to the print procedure
                            # $ra = (address of next instruction)

        li $v0, 4           # print msg4
        la $a0, msg4
        syscall

exit:
        li $v0, 10          # gracefully exit
        syscall

print:
        li $v0, 4           # print msg2
        la $a0, msg2
        syscall

        li $t0, 1           # initial value of the loop
lp:
        bge $t0, $s0, endlp # loop while $t0 < $s0 or while not $t0 >= $so

        li $v0, 1           # print number in $t0
        add $a0, $t0, $0
        syscall

        li $v0, 4           # print newline character
        la $a0, nl
        syscall

        addi $t0, $t0, 1    # increment counter $t0

        j lp

endlp:
        li $v0, 4           # print "Done!"
        la $a0, msg3
        syscall

        jr $ra              # jump to the return address stored in $ra
                            # this marks the end of the print procedure
