        .data
        # declare global data here

        .text
        .globl main         #always required
main:                       # the main label tells the OS where program starts

                            # your program code here

exit:
        li $v0, 10          # always gracefully exit at end of program
        syscall
