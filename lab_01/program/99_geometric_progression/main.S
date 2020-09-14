
            .text

start:      li	    $t0, 8 	# N, NUMBER OF ELEMENTS
            li      $t1, 6 	# Q, denominator
            li	    $t2, 1 	# C, current multiplyer
            move    $t3, $0	# S, SUM
	    
            for_loop:
                addi	$t0, $t0, -1	# N -= 1
                add	$t3, $t3, $t2	# S += C
                mul 	$t2, $t2, $t1 	# C *= Q
                bnez	$t0, for_loop                    
