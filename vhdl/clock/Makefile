GHDL = ghdl
TOP = clock_tb
SRCS = $(TOP).vhd
WAVEFORM_FILE = $(TOP).vcd

all: run

analyze:
	$(GHDL) -a $(SRCS)

elaborate: analyze
	$(GHDL) -e $(TOP)

run: elaborate
	$(GHDL) -r $(TOP) --vcd=$(WAVEFORM_FILE) --stop-time=1ms

clean:
	rm -f *.o *.cf $(TOP) $(TOP).vcd

view:
	surfer $(WAVEFORM_FILE)
