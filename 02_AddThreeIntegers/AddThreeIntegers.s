      .data
msga: .asciiz "a: "
msgb: .asciiz "b: "
msgc: .asciiz "c: "
msgr: .asciiz "a+b+c= "

      .text
      .globl main
main:

                        # read 'a' to $t0
      li $v0, 4         # print string prompt for a
      la $a0, msga
      syscall

      li $v0, 5         # syscall 5 for reading an integer
      syscall           # stores read integer in $v0
      add $t0, $v0, $0

                        # read 'b' to $t1
      li $v0, 4         # print string prompt for b
      la $a0, msgb
      syscall

      li $v0, 5
      syscall
      add $t1, $v0, $0  # moves read integer from $v0 to $t1

                        # read 'c' to $t2
      li $v0, 4         # print string prompt for c
      la $a0, msgc
      syscall

      li $v0, 5
      syscall
      add $t2, $v0, $0  # moves read integer from $v0 to $t2

                        # add
      li $t3, 0
      add $t3, $t0, $t1 # destination: $t3; adding $t0+$t1
      add $t3, $t3, $t2 # destination: $t3; adding $t3+$t2

      # output
      li $v0, 4         # print string msg for the result
      la $a0, msgr
      syscall

      add $a0, $t3, $0  # move integer from $t3 to $a0 for printing
      li $v0, 1         # print an integer with syscall 1
      syscall

      li $v0, 10        # to gracefully exit a program, system call code 10
      syscall           # invoke the syscall