GHDL        = ghdl

DEV_NAME      = multiplier
TOP           = $(DEV_NAME)_tb
TOP_SRC       = $(TOP).vhd
SRCS          = reg.vhd adder.vhd multiplier.vhd
WAVEFORM_FILE = $(TOP).vcd

SIM_AFLAGS  = --std=93
SIM_EFLAGS  = --std=93
SIM_RFLAGS  = --std=93
SIM_RUNOPTS = --vcd=$(WAVEFORM_FILE) --stop-time=1ms

all: run

analyze:
	$(GHDL) -a $(SIM_AFLAGS) $(SRCS)
	$(GHDL) -a $(SIM_AFLAGS) $(TOP_SRC)

elaborate: analyze
	$(GHDL) -e $(SIM_EFLAGS) $(TOP)

run: elaborate
	$(GHDL) -r $(SIM_RFLAGS) $(TOP) $(SIM_RUNOPTS) 

clean:
	rm -f *.o *.cf $(TOP) $(TOP).vcd

view: all
	nohup surfer $(WAVEFORM_FILE) >/dev/null 2>&1 &
