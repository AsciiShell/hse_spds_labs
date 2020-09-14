
            .text

start:      li	    $t0, 8 	# N_max, NUMBER OF ELEMENTS
            li      $t1, 6 	# Q, denominator
            li	    $t2, 1 	# C, current multiplyer
            move    $t3, $0	# S, SUM
            move    $t4, $0 # N, current iteration
	    
            for_loop:
                addiu	$t4, $t4, 1 	    # N -= 1
                addu	$t3, $t3, $t2	    # S += C
                mul 	$t2, $t2, $t1   	# C *= Q
                bne		$t0, $t4, for_loop	# if $t0 == $t4 then target
