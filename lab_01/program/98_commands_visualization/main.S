# simple programm for J, XORI, SLLV, NOR commands
            .text

start:      li	    $t0, 0xFF     
            xori    $v0, $t0, 0        # $v0 = 0xFF
            xori    $v0, $t0, 0xFF     # $v0 = 0x00
            xori    $v0, $t0, 1        # $v0 = 0xFE

            li      $t0, 2
            li      $t1, 2
            sllv    $v0, $t0, $t1      # $v0 = 0x0008
            sllv    $v0, $v0, $t1      # $v0 = 0x0080
            sllv    $v0, $v0, $t1      # $v0 = 0x0800

            li      $t0, 0xF0
            li      $t1, 0x0F
            nor     $v0, $t0, $t1      # $v0 = 0xFFFFFF00
            nor     $v0, $t0, $t0      # $v0 = 0xFFFFFF0F

            j end
            nop
            nop            
end:
            