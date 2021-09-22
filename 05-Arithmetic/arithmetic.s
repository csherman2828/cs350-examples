      .data
amsg: .asciiz "1 + 2 = "
smsg: .asciiz "\n5 - 3 = "
mmsg: .asciiz "\n12 * 12 = "
dmsg: .asciiz "\n50 / 2 = "
rmsg: .asciiz "\n71 % 2 = "

      .text
      .globl main
main:
                            # ~~~~~ ADD ~~~~~
      li $v0, 4             # print string syscall code
      la $a0, amsg          # add message
      syscall

      li $t0, 1             # values for addition
      li $t1, 2
      add $a0, $t0, $t1     # $a0 = $t1 + $t2

      li $v0, 1             # print integer in $a0
      syscall               # this is why we saved the sum to $a0

                            # ~~~~~ SUBTRACT ~~~~~
      li $v0, 4             # I think you know how string printing works by now
      la $a0, smsg
      syscall

      li $t0, 5
      li $t1, 3
      sub $a0, $t0, $t1     # $a0 = $t0 - $t1

      li $v0, 1             # print integer
      syscall

                            # ~~~~~ MULTIPLY (without overflow) ~~~~~
      li $v0, 4
      la $a0, mmsg
      syscall

      li $t0, 4
      li $t1, 10
      mul $a0, $t0, $t1     # the `mul` instruction works like add
                            # a0 = $t0 * $t1
                            # this will not account for overflow
                            # i.e. if $t0 * $t1 > 2^31

      li $v0, 1
      syscall

                            # ~~~~~ MULTIPLY (with overflow) ~~~~~
      li $v0, 4
      la $a0, mmsg
      syscall

      li $t0, 12
      li $t1, 12
      mult $t0, $t1         # alternatively, mult stores the lower 2^32 bits
                            #   in the LO register and the upper 2^32 bits in
                            #   the HI register. To move them out, use `mflo`
                            #   and `mfhi` respectively.

      mflo $a0              # move the LO value (the product without overflow)
                            #   into the $a0 register (so we can print it)

      li $v0, 1             # print the integer in $a0
      syscall

                            # ~~~~~ DIVIDE ~~~~~
      li $v0, 4
      la $a0, dmsg
      syscall

      li $t0, 50
      li $t1, 2
      div $t0, $t1          # similar to mult, `div` uses the HI and LO
                            #   registers. The quotient (result of division)
                            #   is put in LO, so we use MFLO to get it. The
                            #   remainder is stored in HI so we use MFHI to get
                            #   it.
      mflo $a0

      li $v0, 1             # print integer in $a0
      syscall

                            # ~~~~~ REMAINDER ~~~~~
      li $v0, 4
      la $a0, rmsg
      syscall

      li $t0, 71
      li $t1, 2
      div $t0, $t1
      mfhi $a0              # the HI register holds the remainder, so we move
                            #   the HI value into $a0 to print it

      li $v0, 1             # print integer in $a0
      syscall

                            # gracefully exit
      li $v0, 10
      syscall
