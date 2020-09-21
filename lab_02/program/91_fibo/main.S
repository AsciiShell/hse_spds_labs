            .text

init:       move    $t0, $0             # int cur_delay = 0;
            li      $s0, 0x10           # int max_delay = 0x20;

delay:      addiu   $t0, $t0, 1         # cur_delay++;
            bne     $t0, $s0, delay     # if(cur_delay != max_delay) goto delay
            move    $t0, $0             # cur_delay = 0;
	    move    $s1, $0

read:       # lw      $s2, 0x00007f00 ($0) # var = SM_GPIO_REG_INPUT;
            lw      $s2, 0x10010000 ($0)

start_fib:  move    $t0, $0
            li      $t1, 1
            move    $v0, $t1
            # sw      $v0, 0x00007f04 ($0)
            sw      $v0, 0x10010004 ($0)

fibonacci:  addu    $t0, $t0, $t1
            move    $v0, $t0
	    move    $t0, $t1
	    move    $t1, $v0
	    # sw      $v0, 0x00007f04 ($0)
	    sw      $v0, 0x10010004 ($0)
	    addiu   $s1, $s1, 1
            bne     $s2, $s1,  fibonacci
	    beqz    $0, delay
