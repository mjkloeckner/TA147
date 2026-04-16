GHDL = ghdl
TOP = hello_world_tb
SRCS = $(TOP).vhd

all: run

analyze:
	$(GHDL) -a $(SRCS)

elaborate: analyze
	$(GHDL) -e $(TOP)

run: elaborate
	$(GHDL) -r $(TOP) --vcd=$(TOP).vcd

clean:
	rm -f *.o *.cf $(TOP) $(TOP).vcd
