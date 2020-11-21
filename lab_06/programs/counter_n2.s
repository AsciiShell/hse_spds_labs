equ leds, 0x00000000
.global _start
_start:	movia r3, leds
		movi    r4,0
LOOP: 	addi		r4,r4,1
		stbio 	r4, 0(r3)
		br LOOP
.end