# Configuration
BUILD       := build
BIN         := bin
SRC_DIR     := src
RTL_DIR     := rtl

# Device
DEVICE      := xc7k325tffg676
PART        := $(DEVICE)-1
DEVICE_NAME := xc7k325t,-1,ffg676,VVD
CLK_FREQ    := 50
CLK_PERIOD  := 20
XDC         := $(RTL_DIR)/QMTech_XC7K325T_Core.xdc
DBROOT      := /usr/local/share/nextpnr/external/prjxray-db/kintex7
CHIPDB      := $(DBROOT)/$(DEVICE).bin

# Tools
BAMBU       := bambu
YOSYS       := yosys
NEXTPNR     := nextpnr-xilinx
FASM2FRAMES := fasm2frames
FRAMES2BIT  := xc7frames2bit

FPGA_TOP     := $(RTL_DIR)/fpga_top.v
DEBOUNCER    := $(RTL_DIR)/debouncer.v

# Sub-make parameters
TOP_MODULE      ?= fpga_top
HLS_TOP         ?=
BIT_NAME        ?=
HLS_SRCS        ?=
V_SRCS          ?=
SV_SRCS         ?=
YOSYS_FLAGS     ?=
VLOG_MACROS     ?=

# Dynamically resolve paths and generate build commands to support arbitrary lists of sources
HLS_DEPS        := $(addprefix $(SRC_DIR)/, $(HLS_SRCS))
HLS_SRCS_REL    := $(addprefix ../$(SRC_DIR)/, $(HLS_SRCS))
SYNTH_DEPS      := $(V_SRCS) $(SV_SRCS)
YOSYS_READ_CMDS := $(foreach v,$(V_SRCS),read_verilog $(VLOG_MACROS) $(v);) $(foreach sv,$(SV_SRCS),read_verilog $(VLOG_MACROS) -sv $(sv);)

.PHONY: all clean loopback_v loopback_hls bitstream

all: loopback_v loopback_hls

$(BUILD) $(BIN):
	mkdir -p $@

loopback_hls:
	$(MAKE) bitstream \
		BIT_NAME=loopback_hls \
		HLS_SRCS="loopback.cpp" \
		HLS_TOP=loopback \
		V_SRCS="$(FPGA_TOP)" \
		SV_SRCS="$(BUILD)/loopback_hls.sv" \
		VLOG_MACROS="-DHLS_BUILD"

loopback_v:
	$(MAKE) bitstream \
		BIT_NAME=loopback_v \
		V_SRCS="$(FPGA_TOP) $(DEBOUNCER) $(RTL_DIR)/loopback.v"

bitstream: $(BIN)/$(BIT_NAME).bit

# Bambu executes from the build directory to contain intermediate generated files
$(BUILD)/$(BIT_NAME).sv: $(HLS_DEPS) | $(BUILD)
	cd $(BUILD) && \
	$(BAMBU) -v 4 --top-fname=$(HLS_TOP) --clock-period=$(CLK_PERIOD) --writer=V --device-name=$(DEVICE_NAME) --no-clean $(HLS_SRCS_REL) && \
	mv $(HLS_TOP).v $(BIT_NAME).sv && \
	touch array.mem array_a.mem array_b.mem

# Synthesis
$(BUILD)/$(BIT_NAME).json: $(SYNTH_DEPS) | $(BUILD)
	$(YOSYS) $(YOSYS_FLAGS) -p " \
		$(YOSYS_READ_CMDS) \
		synth_xilinx -flatten -top $(TOP_MODULE) -abc9 -family xc7 -nodsp; \
		opt_clean -purge; \
		write_json $@"

# Common Place and Route Pipeline
$(BUILD)/%.fasm: $(BUILD)/%.json | $(BUILD)
	$(NEXTPNR) --json $< --freq $(CLK_FREQ) --chipdb $(CHIPDB) --xdc $(XDC) --fasm $@

$(BUILD)/%.frames: $(BUILD)/%.fasm | $(BUILD)
	$(FASM2FRAMES) --db-root $(DBROOT) --part $(PART) $< $@

$(BIN)/%.bit: $(BUILD)/%.frames | $(BIN)
	$(FRAMES2BIT) --part-file $(DBROOT)/$(PART)/part.yaml -frm_file $< -output_file $@

clean:
	rm -rf $(BUILD) $(BIN)
