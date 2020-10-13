
            .text

init:       li      $s0, 0           # couner for memory
            li      $s1, 0
            li      $s2, 4
            li      $s3, 0
            lui     $s1, 0xffff    
            li      $s3, 0xfff
            sllv    $s3, $s3, $s2
            addu    $s1, $s1, $s3
            addiu   $s1, $s1, 14

read:       lw      $a0, 0 ($s0)      # read from memory
            #sw      $a0, 0 ($0)
            nor     $t0, $a0, $s1       #check for even
            beqz    $t0, invert
            beqz    $0, next

invert:     nor     $t0, $a0, $0
            sw      $t0, 0 ($s0)

next:       addiu   $s0, $s0, 4
            beqz    $0,  read
