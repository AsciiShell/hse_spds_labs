        	.text
start:  	li	$a0, 172
		move	$a1, $0
p0:	    	and	$t0, $a0, 1
		sll	$t0, $t0, 7
		addu	$a1, $a1, $t0
p1:	    	and	$t0, $a0, 2
		sll	$t0, $t0, 5
		addu	$a1, $a1, $t0
p2:	    	and	$t0, $a0, 4
		sll	$t0, $t0, 3
		addu	$a1, $a1, $t0
p3:	    	and	$t0, $a0, 8
		sll	$t0, $t0, 1
		addu	$a1, $a1, $t0
p5:	    	and	$t0, $a0, 240
		srl	$t0, $t0, 4
		addu	$a1, $a1, $t0

