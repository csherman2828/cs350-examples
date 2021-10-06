        .data

        # your data here

        .text
        .globl main

main:                       # main() {
        # your code

        jal func            # function();

        # your code

exit:
        li $v0, 10
        syscall
                            # }

func:                       # function() {

        # your code

        jr $ra              #return;
                            # }
