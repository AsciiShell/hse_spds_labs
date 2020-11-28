.equ switches, 0x00002010
.equ leds, 0x00002000
.global _start
_start: movia 	r2, switches
		movia 	r3, leds
		ldbio   r9, 0(r2)    ## x = 82
        stbio	zero, 0(r3)  ## calculation result reset
sqrt:   movi    r5, 0x4000   ## m = 0x40000000
        mov		r6, zero     ## y = 0
L0:     or      r7, r6, r5   ## b = y | m;
        srli    r6, r6, 1    ## y >>= 1
        blt     r8, r9, L1   ## if (x < b)
							 ##   goto L1
                             ## else
        sub    	r9, r9, r7   ##   x -= b
        or      r6, r6, r5   ##   y |= m
L1:     srli    r5, r5, 2    ## m >>= 2
        bne    	r5, zero, L0 ## if(m != 0) goto L0
        stbio	r6, 0(r3)    ## return y
end:    br    	end          ## while(1);
