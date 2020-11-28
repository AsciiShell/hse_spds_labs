.equ leds, 0x00000000
.global _start
_start:		movia 	r3, leds
			movi	r5, 172
			mov		r6, zero
p0:	    	andi	r4, r5, 1
			slli	r4, r4, 7
			addu	r6, r6, r4
p1:	    	andi	r4, r5, 2
			slli	r4, r4, 5
			addu	r6, r6, r4
p2:	    	andi	r4, r5, 4
			slli	r4, r4, 3
			addu	r6, r6, r4
p3:	    	andi	r4, r5, 8
			slli	r4, r4, 1
			addu	r6, r6, r4
p5:	    	andi	r4, r5, 240
			srli	r4, r4, 4
			addu	r6, r6, r4

