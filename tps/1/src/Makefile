GHDL          = ghdl
DEV_NAME      = intersection_ctrl
TOP           = $(DEV_NAME)_tb
TOP_SRC       = $(TOP).vhd
SRCS          = rtc.vhd rtc_tb.vhd intersection_ctrl.vhd intersection_ctrl_tb.vhd 
WAVEFORM_FILE = $(TOP).vcd

all: run

analyze:
	$(GHDL) -a $(SRCS)
	$(GHDL) -a $(TOP_SRC)

elaborate: analyze
	$(GHDL) -e $(TOP)

run: elaborate
	$(GHDL) -r $(TOP) --vcd=$(WAVEFORM_FILE) --stop-time=200ms

clean:
	rm -f *.o *.cf $(TOP) $(TOP).vcd

view: all
	nohup surfer $(WAVEFORM_FILE) >/dev/null 2>&1 &
