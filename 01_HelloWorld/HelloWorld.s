      .data
msg:  .asciiz "Hello World!"

      .text
      .globl main
main:
      li $v0 4      # syscall code for printing string is 4
      la $a0 msg    # a print string syscall requires msg address in $a0
      syscall       # invoke the syscall

      li $v0 10     # to gracefully exit a program, system call code 10
      syscall       # invoke the syscall