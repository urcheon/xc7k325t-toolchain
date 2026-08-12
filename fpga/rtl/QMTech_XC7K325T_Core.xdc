# https://github.com/ChinaQMTECH/QMTECH_XC7K325T_CORE_BOARD

# Bank 34        1.5v
# Bank 32 - 33   1.8v
# Bank 12 - 16   3.3v


##### SYSCLK

# IO_L12P_T1_MRCC_14 (SYS_CLK_F22)
set_property IOSTANDARD LVCMOS33 [get_ports {SYS_CLK}]
set_property PACKAGE_PIN F22 [get_ports {SYS_CLK}]



##### JTAG (J1)
# 3v3: Pin 1
# GND: Pin 2
# TCK: Pin 3
# TDO: Pin 4
# TDI: Pin 5
# TMS: Pin 6

#set_property IOSTANDARD LVCMOS33 [get_ports {JTAG_TCK}]
#set_property PACKAGE_PIN L8 [get_ports {JTAG_TCK}]

#set_property IOSTANDARD LVCMOS33 [get_ports {JTAG_TDO}]
#set_property PACKAGE_PIN R7 [get_ports {JTAG_TDO}]

#set_property IOSTANDARD LVCMOS33 [get_ports {JTAG_TDI}]
#set_property PACKAGE_PIN R6 [get_ports {JTAG_TDI}]

#set_property IOSTANDARD LVCMOS33 [get_ports {JTAG_TMS}]
#set_property PACKAGE_PIN N8 [get_ports {JTAG_TMS}]



##### SWITCHES (Bank 33 - 1.8v)

# PROGRAM_B
# set_property IOSTANDARD LVCMOS33 [get_ports {SW[1]}]
# set_property PACKAGE_PIN P6 [get_ports {SW[1]}]

# IO_L24N_T3_33 sys_rst_n
set_property IOSTANDARD LVCMOS18 [get_ports {SW[2]}]
set_property PACKAGE_PIN AF9      [get_ports {SW[2]}]

# IO_L24P_T3_33 user_button
set_property IOSTANDARD LVCMOS18 [get_ports {SW[3]}]
set_property PACKAGE_PIN AF10     [get_ports {SW[3]}]



##### LEDS (Bank 14 - 3.3v)

# FPGA_DONE
# set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
# set_property PACKAGE_PIN J7 [get_ports {LED[1]}]

# IO_L18P_T2_A12_D28_14
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN J26      [get_ports {LED[2]}]

# IO_L18N_T2_A11_D27_14
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN H26      [get_ports {LED[3]}]



##### GPIO U4 (Bank 12/13 - 3.3v)
# GND: Pins 1, 2, 5, 6, 61, 62
# VCO_12_13: Pins 3, 4
# VIN: Pins 63, 64

# U4 Pin 07: Bank 12 - IO_L19P_T3 (AD21)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[7]}]
set_property PACKAGE_PIN AD21 [get_ports {GPIO_U4[7]}]

# U4 Pin 08: Bank 12 - IO_L19N_T3_VREF (AE21)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[8]}]
set_property PACKAGE_PIN AE21 [get_ports {GPIO_U4[8]}]

# U4 Pin 09: Bank 12 - IO_L24P_T3 (AE22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[9]}]
set_property PACKAGE_PIN AE22 [get_ports {GPIO_U4[9]}]

# U4 Pin 10: Bank 12 - IO_L24N_T3 (AF22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[10]}]
set_property PACKAGE_PIN AF22 [get_ports {GPIO_U4[10]}]

# U4 Pin 11: Bank 12 - IO_L22P_T3 (AE23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[11]}]
set_property PACKAGE_PIN AE23 [get_ports {GPIO_U4[11]}]

# U4 Pin 12: Bank 12 - IO_L22N_T3 (AF23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[12]}]
set_property PACKAGE_PIN AF23 [get_ports {GPIO_U4[12]}]

# U4 Pin 13: Bank 12 - IO_L6P_T0 (V21)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[13]}]
set_property PACKAGE_PIN V21 [get_ports {GPIO_U4[13]}]

# U4 Pin 14: Bank 12 - IO_L6N_T0_VREF (W21)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[14]}]
set_property PACKAGE_PIN W21 [get_ports {GPIO_U4[14]}]

# U4 Pin 15: Bank 12 - IO_L13P_T2_MRCC (Y22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[15]}]
set_property PACKAGE_PIN Y22 [get_ports {GPIO_U4[15]}]

# U4 Pin 16: Bank 12 - IO_L13N_T2_MRCC (AA22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[16]}]
set_property PACKAGE_PIN AA22 [get_ports {GPIO_U4[16]}]

# U4 Pin 17: Bank 12 - IO_L20P_T3 (AF24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[17]}]
set_property PACKAGE_PIN AF24 [get_ports {GPIO_U4[17]}]

# U4 Pin 18: Bank 12 - IO_L20N_T3 (AF25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[18]}]
set_property PACKAGE_PIN AF25 [get_ports {GPIO_U4[18]}]

# U4 Pin 19: Bank 12 - IO_L18P_T2 (AB21)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[19]}]
set_property PACKAGE_PIN AB21 [get_ports {GPIO_U4[19]}]

# U4 Pin 20: Bank 12 - IO_L18N_T2 (AC21)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[20]}]
set_property PACKAGE_PIN AC21 [get_ports {GPIO_U4[20]}]

# U4 Pin 21: Bank 12 - IO_L17P_T2 (AB22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[21]}]
set_property PACKAGE_PIN AB22 [get_ports {GPIO_U4[21]}]

# U4 Pin 22: Bank 12 - IO_L17N_T2 (AC22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[22]}]
set_property PACKAGE_PIN AC22 [get_ports {GPIO_U4[22]}]

# U4 Pin 23: Bank 12 - IO_L16P_T2 (AD23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[23]}]
set_property PACKAGE_PIN AD23 [get_ports {GPIO_U4[23]}]

# U4 Pin 24: Bank 12 - IO_L16N_T2 (AD24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[24]}]
set_property PACKAGE_PIN AD24 [get_ports {GPIO_U4[24]}]

# U4 Pin 25: Bank 12 - IO_L14P_T2_SRCC (AC23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[25]}]
set_property PACKAGE_PIN AC23 [get_ports {GPIO_U4[25]}]

# U4 Pin 26: Bank 12 - IO_L14N_T2_SRCC (AC24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[26]}]
set_property PACKAGE_PIN AC24 [get_ports {GPIO_U4[26]}]

# U4 Pin 27: Bank 12 - IO_L23P_T3 (AD25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[27]}]
set_property PACKAGE_PIN AD25 [get_ports {GPIO_U4[27]}]

# U4 Pin 28: Bank 12 - IO_L23N_T3 (AE25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[28]}]
set_property PACKAGE_PIN AE25 [get_ports {GPIO_U4[28]}]

# U4 Pin 29: Bank 12 - IO_L11P_T1_SRCC (AA23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[29]}]
set_property PACKAGE_PIN AA23 [get_ports {GPIO_U4[29]}]

# U4 Pin 30: Bank 12 - IO_L11N_T1_SRCC (AB24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[30]}]
set_property PACKAGE_PIN AB24 [get_ports {GPIO_U4[30]}]

# U4 Pin 31: Bank 12 - IO_L7P_T1 (AA25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[31]}]
set_property PACKAGE_PIN AA25 [get_ports {GPIO_U4[31]}]

# U4 Pin 32: Bank 12 - IO_L7N_T1 (AB25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[32]}]
set_property PACKAGE_PIN AB25 [get_ports {GPIO_U4[32]}]

# U4 Pin 33: Bank 12 - IO_L12P_T1_MRCC (Y23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[33]}]
set_property PACKAGE_PIN Y23 [get_ports {GPIO_U4[33]}]

# U4 Pin 34: Bank 12 - IO_L12N_T1_MRCC (AA24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[34]}]
set_property PACKAGE_PIN AA24 [get_ports {GPIO_U4[34]}]

# U4 Pin 35: Bank 12 - IO_L21P_T3_DQS (AD26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[35]}]
set_property PACKAGE_PIN AD26 [get_ports {GPIO_U4[35]}]

# U4 Pin 36: Bank 12 - IO_L21N_T3_DQS (AE26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[36]}]
set_property PACKAGE_PIN AE26 [get_ports {GPIO_U4[36]}]

# U4 Pin 37: Bank 12 - IO_L9P_T1_DQS (AB26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[37]}]
set_property PACKAGE_PIN AB26 [get_ports {GPIO_U4[37]}]

# U4 Pin 38: Bank 12 - IO_L9N_T1_DQS (AC26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[38]}]
set_property PACKAGE_PIN AC26 [get_ports {GPIO_U4[38]}]

# U4 Pin 39: Bank 12 - IO_L8P_T1 (W23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[39]}]
set_property PACKAGE_PIN W23 [get_ports {GPIO_U4[39]}]

# U4 Pin 40: Bank 12 - IO_L8N_T1 (W24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[40]}]
set_property PACKAGE_PIN W24 [get_ports {GPIO_U4[40]}]

# U4 Pin 41: Bank 12 - IO_L10P_T1 (Y25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[41]}]
set_property PACKAGE_PIN Y25 [get_ports {GPIO_U4[41]}]

# U4 Pin 42: Bank 12 - IO_L10N_T1 (Y26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[42]}]
set_property PACKAGE_PIN Y26 [get_ports {GPIO_U4[42]}]

# U4 Pin 43: Bank 12 - IO_L5P_T0 (W25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[43]}]
set_property PACKAGE_PIN W25 [get_ports {GPIO_U4[43]}]

# U4 Pin 44: Bank 12 - IO_L5N_T0 (W26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[44]}]
set_property PACKAGE_PIN W26 [get_ports {GPIO_U4[44]}]

# U4 Pin 45: Bank 12 - IO_L4P_T0 (U26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[45]}]
set_property PACKAGE_PIN U26 [get_ports {GPIO_U4[45]}]

# U4 Pin 46: Bank 12 - IO_L4N_T0 (V26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[46]}]
set_property PACKAGE_PIN V26 [get_ports {GPIO_U4[46]}]

# U4 Pin 47: Bank 12 - IO_L3P_T0_DQS (V23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[47]}]
set_property PACKAGE_PIN V23 [get_ports {GPIO_U4[47]}]

# U4 Pin 48: Bank 12 - IO_L3N_T0_DQS (V24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[48]}]
set_property PACKAGE_PIN V24 [get_ports {GPIO_U4[48]}]

# U4 Pin 49: Bank 12 - IO_L2P_T0 (U24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[49]}]
set_property PACKAGE_PIN U24 [get_ports {GPIO_U4[49]}]

# U4 Pin 50: Bank 12 - IO_L2N_T0 (U25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[50]}]
set_property PACKAGE_PIN U25 [get_ports {GPIO_U4[50]}]

# U4 Pin 51: Bank 13 - IO_L17P_T2 (T22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[51]}]
set_property PACKAGE_PIN T22 [get_ports {GPIO_U4[51]}]

# U4 Pin 52: Bank 13 - IO_L17N_T2 (T23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[52]}]
set_property PACKAGE_PIN T23 [get_ports {GPIO_U4[52]}]

# U4 Pin 53: Bank 13 - IO_L14P_T2_SRCC (R22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[53]}]
set_property PACKAGE_PIN R22 [get_ports {GPIO_U4[53]}]

# U4 Pin 54: Bank 13 - IO_L14N_T2_SRCC (R23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[54]}]
set_property PACKAGE_PIN R23 [get_ports {GPIO_U4[54]}]

# U4 Pin 55: Bank 13 - IO_L6P_T0 (R25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[55]}]
set_property PACKAGE_PIN R25 [get_ports {GPIO_U4[55]}]

# U4 Pin 56: Bank 13 - IO_L6N_T0_VREF (P25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[56]}]
set_property PACKAGE_PIN P25 [get_ports {GPIO_U4[56]}]

# U4 Pin 57: Bank 13 - IO_L11P_T1_SRCC (P23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[57]}]
set_property PACKAGE_PIN P23 [get_ports {GPIO_U4[57]}]

# U4 Pin 58: Bank 13 - IO_L11N_T1_SRCC (N23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[58]}]
set_property PACKAGE_PIN N23 [get_ports {GPIO_U4[58]}]

# U4 Pin 59: Bank 13 - IO_L5P_T0 (N26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[59]}]
set_property PACKAGE_PIN N26 [get_ports {GPIO_U4[59]}]

# U4 Pin 60: Bank 13 - IO_L5N_T0 (M26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U4[60]}]
set_property PACKAGE_PIN M26 [get_ports {GPIO_U4[60]}]



##### GPIO U5 (Bank 14/15/16 - 3.3v)
# GND: Pins 1, 2, 5, 6, 61, 62
# 3v3: Pins 3, 4
# VIN: Pins 63, 64

# U5 Pin 07: Bank 16 - IO_L9N_T1_DQS (A8)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[7]}]
set_property PACKAGE_PIN A8 [get_ports {GPIO_U5[7]}]

# U5 Pin 08: Bank 16 - IO_L9P_T1_DQS (A9)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[8]}]
set_property PACKAGE_PIN A9 [get_ports {GPIO_U5[8]}]

# U5 Pin 09: Bank 16 - IO_L10N_T1 (B9)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[9]}]
set_property PACKAGE_PIN B9 [get_ports {GPIO_U5[9]}]

# U5 Pin 10: Bank 16 - IO_L10P_T1 (C9)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[10]}]
set_property PACKAGE_PIN C9 [get_ports {GPIO_U5[10]}]

# U5 Pin 11: Bank 16 - IO_L22N_T3 (A10)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[11]}]
set_property PACKAGE_PIN A10 [get_ports {GPIO_U5[11]}]

# U5 Pin 12: Bank 16 - IO_L22P_T3 (B10)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[12]}]
set_property PACKAGE_PIN B10 [get_ports {GPIO_U5[12]}]

# U5 Pin 13: Bank 16 - IO_L12N_T1_MRCC (D10)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[13]}]
set_property PACKAGE_PIN D10 [get_ports {GPIO_U5[13]}]

# U5 Pin 14: Bank 16 - IO_L12P_T1_MRCC (E10)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[14]}]
set_property PACKAGE_PIN E10 [get_ports {GPIO_U5[14]}]

# U5 Pin 15: Bank 16 - IO_L20N_T3 (B11)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[15]}]
set_property PACKAGE_PIN B11 [get_ports {GPIO_U5[15]}]

# U5 Pin 16: Bank 16 - IO_L20P_T3 (B12)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[16]}]
set_property PACKAGE_PIN B12 [get_ports {GPIO_U5[16]}]

# U5 Pin 17: Bank 16 - IO_L13N_T2_MRCC (C11)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[17]}]
set_property PACKAGE_PIN C11 [get_ports {GPIO_U5[17]}]

# U5 Pin 18: Bank 16 - IO_L13P_T2_MRCC (C12)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[18]}]
set_property PACKAGE_PIN C12 [get_ports {GPIO_U5[18]}]

# U5 Pin 19: Bank 16 - IO_L24N_T3 (A12)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[19]}]
set_property PACKAGE_PIN A12 [get_ports {GPIO_U5[19]}]

# U5 Pin 20: Bank 16 - IO_L24P_T3 (A13)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[20]}]
set_property PACKAGE_PIN A13 [get_ports {GPIO_U5[20]}]

# U5 Pin 21: Bank 16 - IO_L17N_T2 (D13)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[21]}]
set_property PACKAGE_PIN D13 [get_ports {GPIO_U5[21]}]

# U5 Pin 22: Bank 16 - IO_L17P_T2 (D14)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[22]}]
set_property PACKAGE_PIN D14 [get_ports {GPIO_U5[22]}]

# U5 Pin 23: Bank 16 - IO_L21N_T3_DQS (A14)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[23]}]
set_property PACKAGE_PIN A14 [get_ports {GPIO_U5[23]}]

# U5 Pin 24: Bank 16 - IO_L21P_T3_DQS (B14)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[24]}]
set_property PACKAGE_PIN B14 [get_ports {GPIO_U5[24]}]

# U5 Pin 25: Bank 16 - IO_L19N_T3_VREF (C13)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[25]}]
set_property PACKAGE_PIN C13 [get_ports {GPIO_U5[25]}]

# U5 Pin 26: Bank 16 - IO_L19P_T3 (C14)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[26]}]
set_property PACKAGE_PIN C14 [get_ports {GPIO_U5[26]}]

# U5 Pin 27: Bank 16 - IO_L23N_T3 (A15)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[27]}]
set_property PACKAGE_PIN A15 [get_ports {GPIO_U5[27]}]

# U5 Pin 28: Bank 16 - IO_L23P_T3 (B15)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[28]}]
set_property PACKAGE_PIN B15 [get_ports {GPIO_U5[28]}]

# U5 Pin 29: Bank 15 - IO_L6N_T0_VREF (D16)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[29]}]
set_property PACKAGE_PIN D16 [get_ports {GPIO_U5[29]}]

# U5 Pin 30: Bank 15 - IO_L6P_T0 (D15)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[30]}]
set_property PACKAGE_PIN D15 [get_ports {GPIO_U5[30]}]

# U5 Pin 31: Bank 15 - IO_L1N_T0_AD0N (B16)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[31]}]
set_property PACKAGE_PIN B16 [get_ports {GPIO_U5[31]}]

# U5 Pin 32: Bank 15 - IO_L1P_T0_AD0P (C16)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[32]}]
set_property PACKAGE_PIN C16 [get_ports {GPIO_U5[32]}]

# U5 Pin 33: Bank 15 - IO_L3N_T0_DQS_AD1N (A17)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[33]}]
set_property PACKAGE_PIN A17 [get_ports {GPIO_U5[33]}]

# U5 Pin 34: Bank 15 - IO_L3P_T0_DQS_AD1P (B17)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[34]}]
set_property PACKAGE_PIN B17 [get_ports {GPIO_U5[34]}]

# U5 Pin 35: Bank 15 - IO_L13N_T2_MRCC (D18)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[35]}]
set_property PACKAGE_PIN D18 [get_ports {GPIO_U5[35]}]

# U5 Pin 36: Bank 15 - IO_L13P_T2_MRCC (E18)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[36]}]
set_property PACKAGE_PIN E18 [get_ports {GPIO_U5[36]}]

# U5 Pin 37: Bank 15 - IO_L5N_T0_AD2N (C18)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[37]}]
set_property PACKAGE_PIN C18 [get_ports {GPIO_U5[37]}]

# U5 Pin 38: Bank 15 - IO_L5P_T0_AD2P (C17)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[38]}]
set_property PACKAGE_PIN C17 [get_ports {GPIO_U5[38]}]

# U5 Pin 39: Bank 15 - IO_L2N_T0_AD8N (A19)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[39]}]
set_property PACKAGE_PIN A19 [get_ports {GPIO_U5[39]}]

# U5 Pin 40: Bank 15 - IO_L2P_T0_AD8P (A18)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[40]}]
set_property PACKAGE_PIN A18 [get_ports {GPIO_U5[40]}]

# U5 Pin 41: Bank 15 - IO_L4N_T0_AD9N (B19)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[41]}]
set_property PACKAGE_PIN B19 [get_ports {GPIO_U5[41]}]

# U5 Pin 42: Bank 15 - IO_L4P_T0_AD9P (C19)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[42]}]
set_property PACKAGE_PIN C19 [get_ports {GPIO_U5[42]}]

# U5 Pin 43: Bank 14 - IO_L8N_T1_D12 (A20)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[43]}]
set_property PACKAGE_PIN A20 [get_ports {GPIO_U5[43]}]

# U5 Pin 44: Bank 14 - IO_L8P_T1_D11 (B20)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[44]}]
set_property PACKAGE_PIN B20 [get_ports {GPIO_U5[44]}]

# U5 Pin 45: Bank 15 - IO_L15N_T2_DQS (D20)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[45]}]
set_property PACKAGE_PIN D20 [get_ports {GPIO_U5[45]}]

# U5 Pin 46: Bank 15 - IO_L15P_T2_DQS (D19)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[46]}]
set_property PACKAGE_PIN D19 [get_ports {GPIO_U5[46]}]

# U5 Pin 47: Bank 14 - IO_L4N_T0_D05 (A24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[47]}]
set_property PACKAGE_PIN A24 [get_ports {GPIO_U5[47]}]

# U5 Pin 48: Bank 14 - IO_L4P_T0_D04 (A23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[48]}]
set_property PACKAGE_PIN A23 [get_ports {GPIO_U5[48]}]

# U5 Pin 49: Bank 14 - IO_L9N_T1_DQS_D13 (E22)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[49]}]
set_property PACKAGE_PIN E22 [get_ports {GPIO_U5[49]}]

# U5 Pin 50: Bank 14 - IO_L9P_T1_DQS (E21)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[50]}]
set_property PACKAGE_PIN E21 [get_ports {GPIO_U5[50]}]

# U5 Pin 51: Bank 14 - IO_L11N_T1_SRCC (D24)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[51]}]
set_property PACKAGE_PIN D24 [get_ports {GPIO_U5[51]}]

# U5 Pin 52: Bank 14 - IO_L11P_T1_SRCC (D23)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[52]}]
set_property PACKAGE_PIN D23 [get_ports {GPIO_U5[52]}]

# U5 Pin 53: Bank 14 - IO_L15N_T2_DQS_DOUT (D25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[53]}]
set_property PACKAGE_PIN D25 [get_ports {GPIO_U5[53]}]

# U5 Pin 54: Bank 14 - IO_L15P_T2_DQS_RDWR (E25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[54]}]
set_property PACKAGE_PIN E25 [get_ports {GPIO_U5[54]}]

# U5 Pin 55: Bank 14 - IO_L17N_T2_A13 (E26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[55]}]
set_property PACKAGE_PIN E26 [get_ports {GPIO_U5[55]}]

# U5 Pin 56: Bank 14 - IO_L17P_T2_A14 (F25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[56]}]
set_property PACKAGE_PIN F25 [get_ports {GPIO_U5[56]}]

# U5 Pin 57: Bank 14 - IO_L3N_T0_DQS_EMCCLK (B26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[57]}]
set_property PACKAGE_PIN B26 [get_ports {GPIO_U5[57]}]

# U5 Pin 58: Bank 14 - IO_L3P_T0_DQS_PUDC (B25)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[58]}]
set_property PACKAGE_PIN B25 [get_ports {GPIO_U5[58]}]

# U5 Pin 59: Bank 14 - IO_L5N_T0_D07 (C26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[59]}]
set_property PACKAGE_PIN C26 [get_ports {GPIO_U5[59]}]

# U5 Pin 60: Bank 14 - IO_L5P_T0_D06 (D26)
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_U5[60]}]
set_property PACKAGE_PIN D26 [get_ports {GPIO_U5[60]}]


##### DDR3

# DDR3_DQ[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[0]}]
set_property SLEW FAST [get_ports {DDR3_DQ[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[0]}]
set_property PACKAGE_PIN W1 [get_ports {DDR3_DQ[0]}]

# DDR3_DQ[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[1]}]
set_property SLEW FAST [get_ports {DDR3_DQ[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[1]}]
set_property PACKAGE_PIN V2 [get_ports {DDR3_DQ[1]}]

# DDR3_DQ[2]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[2]}]
set_property SLEW FAST [get_ports {DDR3_DQ[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[2]}]
set_property PACKAGE_PIN Y1 [get_ports {DDR3_DQ[2]}]

# DDR3_DQ[3]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[3]}]
set_property SLEW FAST [get_ports {DDR3_DQ[3]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[3]}]
set_property PACKAGE_PIN Y3 [get_ports {DDR3_DQ[3]}]

# DDR3_DQ[4]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[4]}]
set_property SLEW FAST [get_ports {DDR3_DQ[4]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[4]}]
set_property PACKAGE_PIN AC2 [get_ports {DDR3_DQ[4]}]

# DDR3_DQ[5]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[5]}]
set_property SLEW FAST [get_ports {DDR3_DQ[5]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[5]}]
set_property PACKAGE_PIN Y2 [get_ports {DDR3_DQ[5]}]

# DDR3_DQ[6]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[6]}]
set_property SLEW FAST [get_ports {DDR3_DQ[6]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[6]}]
set_property PACKAGE_PIN AB2 [get_ports {DDR3_DQ[6]}]

# DDR3_DQ[7]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[7]}]
set_property SLEW FAST [get_ports {DDR3_DQ[7]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[7]}]
set_property PACKAGE_PIN AA3 [get_ports {DDR3_DQ[7]}]

# DDR3_DQ[8]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[8]}]
set_property SLEW FAST [get_ports {DDR3_DQ[8]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[8]}]
set_property PACKAGE_PIN U1 [get_ports {DDR3_DQ[8]}]

# DDR3_DQ[9]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[9]}]
set_property SLEW FAST [get_ports {DDR3_DQ[9]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[9]}]
set_property PACKAGE_PIN V4 [get_ports {DDR3_DQ[9]}]

# DDR3_DQ[10]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[10]}]
set_property SLEW FAST [get_ports {DDR3_DQ[10]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[10]}]
set_property PACKAGE_PIN U6 [get_ports {DDR3_DQ[10]}]

# DDR3_DQ[11]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[11]}]
set_property SLEW FAST [get_ports {DDR3_DQ[11]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[11]}]
set_property PACKAGE_PIN W3 [get_ports {DDR3_DQ[11]}]

# DDR3_DQ[12]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[12]}]
set_property SLEW FAST [get_ports {DDR3_DQ[12]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[12]}]
set_property PACKAGE_PIN V6 [get_ports {DDR3_DQ[12]}]

# DDR3_DQ[13]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[13]}]
set_property SLEW FAST [get_ports {DDR3_DQ[13]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[13]}]
set_property PACKAGE_PIN U2 [get_ports {DDR3_DQ[13]}]

# DDR3_DQ[14]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[14]}]
set_property SLEW FAST [get_ports {DDR3_DQ[14]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[14]}]
set_property PACKAGE_PIN U7 [get_ports {DDR3_DQ[14]}]

# DDR3_DQ[15]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[15]}]
set_property SLEW FAST [get_ports {DDR3_DQ[15]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[15]}]
set_property PACKAGE_PIN U5 [get_ports {DDR3_DQ[15]}]

# DDR3_ADDR[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[0]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[0]}]
set_property PACKAGE_PIN AF5 [get_ports {DDR3_ADDR[0]}]

# DDR3_ADDR[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[1]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[1]}]
set_property PACKAGE_PIN AF2 [get_ports {DDR3_ADDR[1]}]

# DDR3_ADDR[2]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[2]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[2]}]
set_property PACKAGE_PIN AD6 [get_ports {DDR3_ADDR[2]}]

# DDR3_ADDR[3]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[3]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[3]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[3]}]
set_property PACKAGE_PIN AC6 [get_ports {DDR3_ADDR[3]}]

# DDR3_ADDR[4]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[4]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[4]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[4]}]
set_property PACKAGE_PIN AD4 [get_ports {DDR3_ADDR[4]}]

# DDR3_ADDR[5]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[5]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[5]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[5]}]
set_property PACKAGE_PIN AB6 [get_ports {DDR3_ADDR[5]}]

# DDR3_ADDR[6]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[6]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[6]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[6]}]
set_property PACKAGE_PIN AE2 [get_ports {DDR3_ADDR[6]}]

# DDR3_ADDR[7]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[7]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[7]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[7]}]
set_property PACKAGE_PIN Y5 [get_ports {DDR3_ADDR[7]}]

# DDR3_ADDR[8]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[8]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[8]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[8]}]
set_property PACKAGE_PIN AA4 [get_ports {DDR3_ADDR[8]}]

# DDR3_ADDR[9]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[9]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[9]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[9]}]
set_property PACKAGE_PIN AE6 [get_ports {DDR3_ADDR[9]}]

# DDR3_ADDR[10]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[10]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[10]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[10]}]
set_property PACKAGE_PIN AE3 [get_ports {DDR3_ADDR[10]}]

# DDR3_ADDR[11]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[11]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[11]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[11]}]
set_property PACKAGE_PIN AD5 [get_ports {DDR3_ADDR[11]}]

# DDR3_ADDR[12]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[12]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[12]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[12]}]
set_property PACKAGE_PIN AB4 [get_ports {DDR3_ADDR[12]}]

# DDR3_ADDR[13]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[13]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[13]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[13]}]
set_property PACKAGE_PIN Y6 [get_ports {DDR3_ADDR[13]}]

# DDR3_BA[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_BA[0]}]
set_property SLEW FAST [get_ports {DDR3_BA[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[0]}]
set_property PACKAGE_PIN AD3 [get_ports {DDR3_BA[0]}]

# DDR3_BA[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_BA[1]}]
set_property SLEW FAST [get_ports {DDR3_BA[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[1]}]
set_property PACKAGE_PIN AE1 [get_ports {DDR3_BA[1]}]

# DDR3_BA[2]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_BA[2]}]
set_property SLEW FAST [get_ports {DDR3_BA[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[2]}]
set_property PACKAGE_PIN AE5 [get_ports {DDR3_BA[2]}]

# DDR3_RAS_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_RAS_N}]
set_property SLEW FAST [get_ports {DDR3_RAS_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_RAS_N}]
set_property PACKAGE_PIN AC3 [get_ports {DDR3_RAS_N}]

# DDR3_CAS_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CAS_N}]
set_property SLEW FAST [get_ports {DDR3_CAS_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_CAS_N}]
set_property PACKAGE_PIN AC4 [get_ports {DDR3_CAS_N}]

# DDR3_WE_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_WE_N}]
set_property SLEW FAST [get_ports {DDR3_WE_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_WE_N}]
set_property PACKAGE_PIN AF4 [get_ports {DDR3_WE_N}]

# DDR3_RESET_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_RESET_N}]
set_property SLEW FAST [get_ports {DDR3_RESET_N}]
set_property IOSTANDARD LVCMOS15 [get_ports {DDR3_RESET_N}]
set_property PACKAGE_PIN W4 [get_ports {DDR3_RESET_N}]

# DDR3_CKE
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CKE}]
set_property SLEW FAST [get_ports {DDR3_CKE}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_CKE}]
set_property PACKAGE_PIN AD1 [get_ports {DDR3_CKE}]

# DDR3_ODT
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ODT}]
set_property SLEW FAST [get_ports {DDR3_ODT}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ODT}]
set_property PACKAGE_PIN AF3 [get_ports {DDR3_ODT}]

# DDR3_DQM[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQM[0]}]
set_property SLEW FAST [get_ports {DDR3_DQM[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQM[0]}]
set_property PACKAGE_PIN V1 [get_ports {DDR3_DQM[0]}]

# DDR3_DQM[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQM[1]}]
set_property SLEW FAST [get_ports {DDR3_DQM[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQM[1]}]
set_property PACKAGE_PIN V3 [get_ports {DDR3_DQM[1]}]

# DDR3_DQS_P[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_P[0]}]
set_property SLEW FAST [get_ports {DDR3_DQS_P[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[0]}]
set_property PACKAGE_PIN AB1 [get_ports {DDR3_DQS_P[0]}]

# DDR3_DQS_N[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_N[0]}]
set_property SLEW FAST [get_ports {DDR3_DQS_N[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[0]}]
set_property PACKAGE_PIN AC1 [get_ports {DDR3_DQS_N[0]}]

# DDR3_DQS_P[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_P[1]}]
set_property SLEW FAST [get_ports {DDR3_DQS_P[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[1]}]
set_property PACKAGE_PIN W6 [get_ports {DDR3_DQS_P[1]}]

# DDR3_DQS_N[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_N[1]}]
set_property SLEW FAST [get_ports {DDR3_DQS_N[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[1]}]
set_property PACKAGE_PIN W5 [get_ports {DDR3_DQS_N[1]}]

# DDR3_CLK_P
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CLK_P}]
set_property SLEW FAST [get_ports {DDR3_CLK_P}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_CLK_P}]
set_property PACKAGE_PIN AA5 [get_ports {DDR3_CLK_P}]

# DDR3_CLK_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CLK_N}]
set_property SLEW FAST [get_ports {DDR3_CLK_N}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_CLK_N}]
set_property PACKAGE_PIN AB5 [get_ports {DDR3_CLK_N}]

