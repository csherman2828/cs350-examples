# Choose color:
# 1. Red
# 2. Green
# 3. Blue
# >
.data
                            # declare global data here
chCl:   .asciiz "Choose color:\n"
red:    .asciiz "1. Red\n"
gre:    .asciiz "2. Green\n"
blu:    .asciiz "3. Blue\n"
exi:    .asciiz "4. Exit\n"
prmt:   .asciiz "> "
pred:   .asciiz "You chose red!\n"
pgre:   .asciiz "You chose green!\n"
pblu:   .asciiz "You chose blue!\n"
invi:   .asciiz "Input was invalid\n"

        .text
        .globl main         #always required
main:                       # the main label tells the OS where program starts

                            # your program code here
        li $v0, 4           # print color prompt
        la $a0, chCl
        syscall

        la $a0, red        # red
        syscall

        la $a0, gre        # green
        syscall

        la $a0, blu        # blue
        syscall

        la $a0, exi        # exit
        syscall

        la $a0, prmt       # the carrot for use input
        syscall

        li $v0, 5          # read the user choice
        syscall

        # $t0 = user input
        add $t0, $v0, $zero
        li $t1, 1
        li $t2, 2
        li $t3, 3
        li $t4, 4

        beq $t0, $t1, fred # if 1
        beq $t0, $t2, fgre # else if 2
        beq $t0, $t3, fblu # else if 3
        beq $t0, $t4, exit # else if 4

                           # else
        li $v0, 4
        la $a0, invi
        syscall

        j main

fred:
        li $v0, 4
        la $a0, pred
        syscall

        j main

fgre:
        li $v0, 4
        la $a0, pgre
        syscall

        j main

fblu:
        li $v0, 4
        la $a0, pblu
        syscall

        j main

exit:
        li $v0, 10          # always gracefully exit at end of program
        syscall
