GHDL = ghdl
TOP = if_elsif_else_tb
SRCS = $(TOP).vhd

all: run

analyze:
	$(GHDL) -a $(SRCS)

elaborate: analyze
	$(GHDL) -e $(TOP)

run: elaborate
	$(GHDL) -r $(TOP) --vcd=$(TOP).vcd --stop-time=999ms

clean:
	rm -f *.o *.cf $(TOP) $(TOP).vcd
