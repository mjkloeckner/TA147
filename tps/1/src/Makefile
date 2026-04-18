GHDL     = ghdl

GHDL_AFLAGS = --std=93
GHDL_EFLAGS = --std=93
GHDL_RFLAGS = --std=93

DEV_NAME = intersection_ctrl
TOP      = $(DEV_NAME)_tb
RTL_DIR  = rtl
TB_DIR   = tb

PKG_SRCS = $(wildcard $(RTL_DIR)/*_pkg.vhd)
RTL_SRCS = \
	   $(RTL_DIR)/rtc.vhd \
	   $(RTL_DIR)/cnt.vhd \
	   $(RTL_DIR)/semaphore.vhd \
	   $(RTL_DIR)/intersection_ctrl.vhd
TB_SRCS  = $(wildcard $(TB_DIR)/*.vhd)

SRCS          = $(PKG_SRCS) $(RTL_SRCS) $(TB_SRCS)
WAVEFORM_FILE = $(TOP).vcd
RUNOPTS       = --vcd=$(WAVEFORM_FILE) --stop-time=1ms


all: run

analyze:
	$(GHDL) -a $(GHDL_AFLAGS) $(PKG_SRCS)
	$(GHDL) -a $(GHDL_AFLAGS) $(RTL_SRCS)
	$(GHDL) -a $(GHDL_AFLAGS) $(TB_SRCS)

elaborate: analyze
	$(GHDL) -e $(GHDL_EFLAGS) $(TOP)

run: elaborate
	$(GHDL) -r $(GHDL_RFLAGS) $(TOP) $(RUNOPTS)

clean:
	rm -f *.o *.cf $(TOP) $(WAVEFORM_FILE)

view: all
	nohup surfer $(WAVEFORM_FILE) >/dev/null 2>&1 &
