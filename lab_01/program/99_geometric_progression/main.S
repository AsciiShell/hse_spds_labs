
            .text

start:      li      $t0, 8  # N_max, NUMBER OF ELEMENTS
            li      $t1, 6  # Q, denominator
            li      $t2, 1  # C, current multiplyer
            move    $t3, $0 # S, SUM
            move    $t4, $0 # N, current iteration
      
            for_loop:
                addiu   $t4, $t4, 1         # N -= 1
                addu    $t3, $t3, $t2       # S += C
                
                move    $a0, $t2
                move    $a1, $t1
                j multiplyer
                multiplyer_back:
                move    $t2, $v0            # C = C * Q
                bne     $t0, $t4, for_loop  # if $t0 == $t4 then target
            j end

multiplyer: # $v0 = $a0 + $a0 + $a0 ... $a1 times
            move $v0, $0
            move $a2, $0            # mul time counter
            multiplyer_for_loop:
                beq	    $a2, $a1, multiplyer_back
                addiu   $a2, $a2, 1
                addu    $v0, $v0, $a0
                j multiplyer_for_loop

end:        
            move $v0, $t3 # Write result