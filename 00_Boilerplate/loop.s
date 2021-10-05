        .data

        # any global data you want for your program

        .text
        .globl main

main:
        li $s0, 20          # int limit = 20
        li $t0, 0           # int i = 0

lp:                         # "loop" label gives us a spot to jump to
        bge $t0, $s0, endlp # loop condition
                            # use the opposite of condition for while(condition)
                            # if loop while(i < limit), then...
                            #   end loop if i >= limit
                            #   hence, bge i, limit, label-pointing-to-end

        # then your code that runs in the loop

        addi $t0, $t0, 1    # remember to get closer to ending loop
                            # that may be increasing i every time so it gets
                            #   closer to limit

        j lp

endlp:                      # label the code right after the loop where you'll
                            #   go to when the loop is over

        # your code after the loop

exit:
        li $v0, 10          # always gracefully exit
        syscall
