      .data
amsg: .asciiz "1 + 2 = "
smsg: .asciiz "\n5 - 3 = "
mmsg: .asciiz "\n10 * 4 = "
dmsg: .asciiz "\n50 / 2 = "
rmsg: .asciiz "\n71 % 2 = "

      .text
      .globl main
main:
                            # add
      li $v0, 4
      la $a0, amsg
      syscall

      li $t0, 1
      li $t1, 2
      add $a0, $t0, $t1

      li $v0, 1
      syscall

                            # subtract
      li $v0, 4
      la $a0, smsg
      syscall

      li $t0, 5
      li $t1, 3
      sub $a0, $t0, $t1

      li $v0, 1
      syscall

                            # multiply (without overflow)
      li $v0, 4
      la $a0, mmsg
      syscall

      li $t0, 4
      li $t1, 10
      mul $a0, $t0, $t1

      li $v0, 1
      syscall

                            # multiply (with possible overflow)
      li $v0, 4
      la $a0, mmsg
      syscall

      li $t0, 4
      li $t1, 10
      mult $t0, $t1
      mflo $a0

      li $v0, 1
      syscall

                            # division
      li $v0, 4
      la $a0, dmsg
      syscall

      li $t0, 50
      li $t1, 2
      div $t0, $t1
      mflo $a0

      li $v0, 1
      syscall

                            # remainder
      li $v0, 4
      la $a0, rmsg
      syscall

      li $t0, 71
      li $t1, 2
      div $t0, $t1
      mfhi $a0

      li $v0, 1
      syscall

                            # gracefully exit
      li $v0, 10
      syscall
