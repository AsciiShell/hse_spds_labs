
        .text
		
init:       move    $t0, $0             # int cur_delay = 0;
            li      $s0, 0x10           # int max_delay = 0x20;		
		
delay:      addiu   $t0, $t0, 1         # cur_delay++;
            bne     $t0, $s0, delay     # if(cur_delay != max_delay) goto delay
            move    $t0, $0             # cur_delay = 0;
			
read:       # lw      $a0, 0x00007f00 ($0) # var = SM_GPIO_REG_INPUT;
            lw      $a0, 0x10010000 ($0)
			li      $v0, 0   


sqrt:   lui     $t0, 0x4000     ## m = 0x40000000
        move    $t1, $0         ## y = 0

L0:     or      $t2, $t1, $t0   ## b = y | m;
        srl     $t1, $t1, 1     ## y >>= 1
        sltu    $t3, $a0, $t2   ## if (x < b)
        bnez    $t3, L1         ##   goto L1
                                ## else
        subu    $a0, $a0, $t2   ##   x -= b
        or      $t1, $t1, $t0   ##   y |= m

L1:     srl     $t0, $t0, 2     ## m >>= 2
        bnez    $t0, L0         ## if(m != 0) goto L0
        move    $v0, $t1        ## return y
		# sw      $v0, 0x00007f04 ($0)
        sw      $v0, 0x10010004 ($0)
		

end:    beqz    $0,  delay        ## while(1);
