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
DBROOT      := /usr/local/share/nextpnr/external/prjxray-db/kintex7
CHIPDB      := $(DBROOT)/$(DEVICE).bin

# Tools
BAMBU       := bambu
YOSYS       := yosys
NEXTPNR     := nextpnr-xilinx
FASM2FRAMES := fasm2frames
FRAMES2BIT  := xc7frames2bit

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

.PHONY: all clean core_loopback dev_loopback bitstream

all: core_loopback dev_loopback

core_loopback: core_loopback_hls core_loopback_v

dev_loopback: dev_loopback_hls dev_loopback_v

$(BUILD) $(BIN):
	mkdir -p $@

# Board-specific top/xdc file locations
CORE_TOP := $(RTL_DIR)/QMTech_XC7K325T_Core_loopback_top.v
CORE_XDC := $(RTL_DIR)/QMTech_XC7K325T_Core.xdc

DEV_TOP  := $(RTL_DIR)/QMTech_Kintex7_Dev_loopback_top.v
DEV_XDC  := $(RTL_DIR)/QMTech_Kintex7_Dev.xdc

# Target-specific variable assignments
core_loopback_hls core_loopback_v: FPGA_TOP := $(CORE_TOP)
core_loopback_hls core_loopback_v: FPGA_XDC := $(CORE_XDC)

dev_loopback_hls dev_loopback_v: FPGA_TOP := $(DEV_TOP)
dev_loopback_hls dev_loopback_v: FPGA_XDC := $(DEV_XDC)

core_loopback_hls:
	$(MAKE) bitstream \
		BIT_NAME=core_loopback_hls \
		HLS_SRCS="loopback.cpp" \
		HLS_TOP=loopback \
		XDC="$(FPGA_XDC)" \
		V_SRCS="$(FPGA_TOP)" \
		SV_SRCS="$(BUILD)/core_loopback_hls.sv" \
		VLOG_MACROS="-DHLS_BUILD"

core_loopback_v:
	$(MAKE) bitstream \
		BIT_NAME=core_loopback_v \
		XDC="$(FPGA_XDC)" \
		V_SRCS="$(FPGA_TOP) $(DEBOUNCER) $(RTL_DIR)/loopback.v"

dev_loopback_hls:
	$(MAKE) bitstream \
		BIT_NAME=dev_loopback_hls \
		HLS_SRCS="loopback.cpp" \
		HLS_TOP=loopback \
		XDC="$(FPGA_XDC)" \
		V_SRCS="$(FPGA_TOP)" \
		SV_SRCS="$(BUILD)/dev_loopback_hls.sv" \
		VLOG_MACROS="-DHLS_BUILD"

dev_loopback_v:
	$(MAKE) bitstream \
		BIT_NAME=dev_loopback_v \
		XDC="$(FPGA_XDC)" \
		V_SRCS="$(FPGA_TOP) $(DEBOUNCER) $(RTL_DIR)/loopback.v"

bitstream: $(BIN)/$(BIT_NAME).bit

# Bambu executes from the build directory to contain intermediate generated files
$(BUILD)/$(BIT_NAME).sv: $(HLS_DEPS) | $(BUILD)
	cd $(BUILD) && \
	$(BAMBU) -v 4 --top-fname=$(HLS_TOP) --clock-period=$(CLK_PERIOD) \
		--writer=V --device-name=$(DEVICE_NAME) --generate-interface=INFER \
		--no-clean $(HLS_SRCS_REL) && \
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
