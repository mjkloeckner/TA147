GHDL          = ghdl
DEV_NAME      = rtc
TOP           = $(DEV_NAME)_tb
TOP_SRC       = $(TOP).vhd
SRCS          = $(DEV_NAME).vhd
WAVEFORM_FILE = $(TOP).vcd

all: run

analyze:
	$(GHDL) -a $(SRCS)
	$(GHDL) -a $(TOP_SRC)

elaborate: analyze
	$(GHDL) -e $(TOP)

run: elaborate
	$(GHDL) -r $(TOP) --vcd=$(WAVEFORM_FILE) --stop-time=2ms

clean:
	rm -f *.o *.cf $(TOP) $(TOP).vcd

view: all
	nohup surfer $(WAVEFORM_FILE) >/dev/null 2>&1 &
