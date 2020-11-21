.equ leds, 0x00002000
.global _start
_start:	movia 	r3, leds
		movi	r4, 0
		movi	r5, 1
		stbio	r5, 0(r3)
LOOP: 	addu	r4, r4, r5
		stbio	r4, 0(r3)
		addu	r5, r4, r5
		stbio	r5, 0(r3)
		br LOOP
.end