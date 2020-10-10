
            .text

init:       move    $s0, $0             # couner for memory
            li	   $s2, 16
            li     $s1, 0xffff             # int max_delay = 0x20;
            sllv   $s1, $s1, $s2
            li     $s2, 0xfffe
            addu    $s1, $s1, $s2

read:       lw      $a0, 0x0 ($s0)       # read from memory
            nor     $t0, $a0, $s1       #check for even
            beqz    $t0, invert
            beqz    $0, next

invert:     nor     $t0, $a0, $0
            sw      $t0, 0x0 ($s0)

next:       addiu   $s0, $s0, 4
            beqz    $0, read
