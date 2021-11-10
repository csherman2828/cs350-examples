        .data
buf:    .space 10
        .align 2
prmt:   .asciiz "Enter something: "

        .text
        .globl main         #always required
main:                       # the main label tells the OS where program starts

        li $v0, 4
        la $a0, prmt
        syscall

        li $v0, 8
        la $a0, buf
        li $a1, 9
        syscall

        li $v0, 4
        la $a0, buf
        syscall

exit:
        li $v0, 10          # always gracefully exit at end of program
        syscall
