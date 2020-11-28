.equ switches, 0x00002010
.equ leds, 0x00002000
.global _start
_start:	movia 	r2, switches
		movia 	r3, leds
		movi	r4, 0
		movi	r5,	10	## кол-во 
		movi	r6, 8	## знаменатель
		movi	r7, 1
		
LOOP: 	mul		r7, r7, r6
		addu	r4, r4, r7
		sub		r5, r5, 1
		bne		r5, zero, LOOP
		stbio 	r4, 0(r3)