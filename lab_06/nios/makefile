# Created by the Intel FPGA Monitor Program
# DO NOT MODIFY

############################################
# Global Defines
DEFINE_COMMA	:= ,

############################################
# Compilation Targets

# Programs
AS		:= nios2-elf-as
CC		:= nios2-elf-gcc
LD		:= nios2-elf-ld
OC		:= nios2-elf-objcopy
RM		:= rm -f

# Flags
USERCCFLAGS	:= -g -O1 -ffunction-sections -fverbose-asm -fno-inline -mno-cache-volatile
ARCHASFLAGS	:= --gstabs -I "D:/intelFPGA_lite/17.1/nios2eds/components/altera_nios2/sdk/inc/"
ARCHCCFLAGS	:= -mhw-mul -mno-hw-div -I "D:/intelFPGA_lite/17.1/nios2eds/components/altera_nios2/HAL/inc/" -DSYSTEM_BUS_WIDTH=32 -DALT_SINGLE_THREADED
ARCHLDFLAGS	:= --defsym nasys_stack_top=0x2000 --defsym nasys_program_mem=0x1000 --defsym nasys_data_mem=0x1000
ARCHLDSCRIPT	:= --script="D:/intelFPGA_lite/17.1/University_Program/Monitor_Program/build/nios_as_build.ld"
ASFLAGS		:= $(ARCHASFLAGS)
CCFLAGS		:= -Wall -c $(USERCCFLAGS) $(ARCHCCFLAGS)
LDFLAGS		:= $(ARCHLDFLAGS) $(ARCHLDSCRIPT) -e _start -u _start
OCFLAGS		:= -O srec

# Files
HDRS		:=
SRCS		:= ../programs/counter_n2.s
OBJS		:= $(patsubst %, %.o, $(SRCS))

# Targets
compile: counter_n2.srec

counter_n2.srec: counter_n2.elf
	$(RM) $@
	$(OC) $(OCFLAGS) $< $@

counter_n2.elf: $(OBJS)
	$(RM) $@
	$(LD) $(LDFLAGS) $(OBJS) -o $@

%.c.o: %.c $(HDRS)
	$(RM) $@
	$(CC) $(CCFLAGS) $< -o $@

%.s.o: %.s $(HDRS)
	$(RM) $@
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) counter_n2.srec counter_n2.elf $(OBJS)

