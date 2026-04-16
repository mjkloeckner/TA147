GHDL = ghdl
TOP = signal_tb
SRCS = $(TOP).vhd

all: run

analyze:
	$(GHDL) -a $(SRCS)

elaborate: analyze
	$(GHDL) -e $(TOP)

run: elaborate
	$(GHDL) -r $(TOP) --vcd=$(TOP).vcd --stop-time=1ms

clean:
	rm -f *.o *.cf $(TOP) $(TOP).vcd
