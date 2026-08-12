# https://github.com/ChinaQMTECH/QMTECH_Kintex-7_Development_Board

# Bank IO Standards:
# Bank 12 - 3.3v (Default, configurable to other voltages via JP5 VCCO_12)
# Bank 14 - 3.3v
# Bank 15 - 3.3v
# Bank 16 - 3.3v


##### SYSCLK

# 50MHz System Clock (Y1)
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



##### SWITCHES

# SW1 / PROGRAM_B
# set_property IOSTANDARD LVCMOS33 [get_ports {SW[1]}]
# set_property PACKAGE_PIN P6 [get_ports {SW[1]}]

# SW2 (1.8v pull-up)
set_property IOSTANDARD LVCMOS18 [get_ports {SW[2]}]
set_property PACKAGE_PIN V26 [get_ports {SW[2]}]

# SW3 (1.8v pull-up)
set_property IOSTANDARD LVCMOS18 [get_ports {SW[3]}]
set_property PACKAGE_PIN U26 [get_ports {SW[3]}]



##### LEDS

# D1 / FPGA_DONE
# set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
# set_property PACKAGE_PIN J7 [get_ports {LED[1]}]

# D2
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN R26 [get_ports {LED[2]}]

# D3
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN P26 [get_ports {LED[3]}]

# D7
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property PACKAGE_PIN N26 [get_ports {LED[4]}]



##### GPIO JP5 (Bank 12 - 3.3v Default)
# GND: Pins 1, 2, 47, 48
# VCO_12: Pins 3, 4 (3.3v)
# 5v: Pins 49, 50

# JP5 Pin 05: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[5]}]
set_property PACKAGE_PIN AD21 [get_ports {GPIO_JP5[5]}]

# JP5 Pin 06: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[6]}]
set_property PACKAGE_PIN AE21 [get_ports {GPIO_JP5[6]}]

# JP5 Pin 07: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[7]}]
set_property PACKAGE_PIN AE22 [get_ports {GPIO_JP5[7]}]

# JP5 Pin 08: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[8]}]
set_property PACKAGE_PIN AF22 [get_ports {GPIO_JP5[8]}]

# JP5 Pin 09: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[9]}]
set_property PACKAGE_PIN AE23 [get_ports {GPIO_JP5[9]}]

# JP5 Pin 10: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[10]}]
set_property PACKAGE_PIN AF23 [get_ports {GPIO_JP5[10]}]

# JP5 Pin 11: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[11]}]
set_property PACKAGE_PIN V21 [get_ports {GPIO_JP5[11]}]

# JP5 Pin 12: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[12]}]
set_property PACKAGE_PIN W21 [get_ports {GPIO_JP5[12]}]

# JP5 Pin 13: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[13]}]
set_property PACKAGE_PIN Y22 [get_ports {GPIO_JP5[13]}]

# JP5 Pin 14: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[14]}]
set_property PACKAGE_PIN AA22 [get_ports {GPIO_JP5[14]}]

# JP5 Pin 15: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[15]}]
set_property PACKAGE_PIN AF24 [get_ports {GPIO_JP5[15]}]

# JP5 Pin 16: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[16]}]
set_property PACKAGE_PIN AF25 [get_ports {GPIO_JP5[16]}]

# JP5 Pin 17: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[17]}]
set_property PACKAGE_PIN AB21 [get_ports {GPIO_JP5[17]}]

# JP5 Pin 18: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[18]}]
set_property PACKAGE_PIN AC21 [get_ports {GPIO_JP5[18]}]

# JP5 Pin 19: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[19]}]
set_property PACKAGE_PIN AB22 [get_ports {GPIO_JP5[19]}]

# JP5 Pin 20: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[20]}]
set_property PACKAGE_PIN AC22 [get_ports {GPIO_JP5[20]}]

# JP5 Pin 21: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[21]}]
set_property PACKAGE_PIN AD23 [get_ports {GPIO_JP5[21]}]

# JP5 Pin 22: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[22]}]
set_property PACKAGE_PIN AD24 [get_ports {GPIO_JP5[22]}]

# JP5 Pin 23: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[23]}]
set_property PACKAGE_PIN AC23 [get_ports {GPIO_JP5[23]}]

# JP5 Pin 24: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[24]}]
set_property PACKAGE_PIN AC24 [get_ports {GPIO_JP5[24]}]

# JP5 Pin 25: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[25]}]
set_property PACKAGE_PIN AD25 [get_ports {GPIO_JP5[25]}]

# JP5 Pin 26: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[26]}]
set_property PACKAGE_PIN AE25 [get_ports {GPIO_JP5[26]}]

# JP5 Pin 27: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[27]}]
set_property PACKAGE_PIN AA23 [get_ports {GPIO_JP5[27]}]

# JP5 Pin 28: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[28]}]
set_property PACKAGE_PIN AB24 [get_ports {GPIO_JP5[28]}]

# JP5 Pin 29: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[29]}]
set_property PACKAGE_PIN AA25 [get_ports {GPIO_JP5[29]}]

# JP5 Pin 30: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[30]}]
set_property PACKAGE_PIN AB25 [get_ports {GPIO_JP5[30]}]

# JP5 Pin 31: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[31]}]
set_property PACKAGE_PIN Y23 [get_ports {GPIO_JP5[31]}]

# JP5 Pin 32: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[32]}]
set_property PACKAGE_PIN AA24 [get_ports {GPIO_JP5[32]}]

# JP5 Pin 33: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[33]}]
set_property PACKAGE_PIN AD26 [get_ports {GPIO_JP5[33]}]

# JP5 Pin 34: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[34]}]
set_property PACKAGE_PIN AE26 [get_ports {GPIO_JP5[34]}]

# JP5 Pin 35: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[35]}]
set_property PACKAGE_PIN AB26 [get_ports {GPIO_JP5[35]}]

# JP5 Pin 36: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[36]}]
set_property PACKAGE_PIN AC26 [get_ports {GPIO_JP5[36]}]

# JP5 Pin 37: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[37]}]
set_property PACKAGE_PIN W23 [get_ports {GPIO_JP5[37]}]

# JP5 Pin 38: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[38]}]
set_property PACKAGE_PIN W24 [get_ports {GPIO_JP5[38]}]

# JP5 Pin 39: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[39]}]
set_property PACKAGE_PIN Y25 [get_ports {GPIO_JP5[39]}]

# JP5 Pin 40: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[40]}]
set_property PACKAGE_PIN Y26 [get_ports {GPIO_JP5[40]}]

# JP5 Pin 41: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[41]}]
set_property PACKAGE_PIN W25 [get_ports {GPIO_JP5[41]}]

# JP5 Pin 42: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[42]}]
set_property PACKAGE_PIN W26 [get_ports {GPIO_JP5[42]}]

# JP5 Pin 43: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[43]}]
set_property PACKAGE_PIN V23 [get_ports {GPIO_JP5[43]}]

# JP5 Pin 44: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[44]}]
set_property PACKAGE_PIN V24 [get_ports {GPIO_JP5[44]}]

# JP5 Pin 45: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[45]}]
set_property PACKAGE_PIN U24 [get_ports {GPIO_JP5[45]}]

# JP5 Pin 46: Bank 12
set_property IOSTANDARD LVCMOS33 [get_ports {GPIO_JP5[46]}]
set_property PACKAGE_PIN U25 [get_ports {GPIO_JP5[46]}]


##### PMOD J11
# GND: Pins 5, 11
# 3.3v: Pins 6, 12

# J11 Pin 01: Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[1]}]
set_property PACKAGE_PIN C16 [get_ports {PMOD_J11[1]}]

# J11 Pin 02: Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[2]}]
set_property PACKAGE_PIN A17 [get_ports {PMOD_J11[2]}]

# J11 Pin 03: Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[3]}]
set_property PACKAGE_PIN A18 [get_ports {PMOD_J11[3]}]

# J11 Pin 04: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[4]}]
set_property PACKAGE_PIN A20 [get_ports {PMOD_J11[4]}]

# J11 Pin 07: Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[7]}]
set_property PACKAGE_PIN B16 [get_ports {PMOD_J11[7]}]

# J11 Pin 08: Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[8]}]
set_property PACKAGE_PIN B17 [get_ports {PMOD_J11[8]}]

# J11 Pin 09: Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[9]}]
set_property PACKAGE_PIN B19 [get_ports {PMOD_J11[9]}]

# J11 Pin 10: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J11[10]}]
set_property PACKAGE_PIN B20 [get_ports {PMOD_J11[10]}]


##### PMOD J12
# GND: Pins 5, 11
# 3.3v: Pins 6, 12

# J12 Pin 01: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[1]}]
set_property PACKAGE_PIN E21 [get_ports {PMOD_J12[1]}]

# J12 Pin 02: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[2]}]
set_property PACKAGE_PIN D23 [get_ports {PMOD_J12[2]}]

# J12 Pin 03: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[3]}]
set_property PACKAGE_PIN D25 [get_ports {PMOD_J12[3]}]

# J12 Pin 04: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[4]}]
set_property PACKAGE_PIN F23 [get_ports {PMOD_J12[4]}]

# J12 Pin 07: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[7]}]
set_property PACKAGE_PIN E22 [get_ports {PMOD_J12[7]}]

# J12 Pin 08: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[8]}]
set_property PACKAGE_PIN D24 [get_ports {PMOD_J12[8]}]

# J12 Pin 09: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[9]}]
set_property PACKAGE_PIN E25 [get_ports {PMOD_J12[9]}]

# J12 Pin 10: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J12[10]}]
set_property PACKAGE_PIN F24 [get_ports {PMOD_J12[10]}]


##### PMOD J13
# GND: Pins 5, 11
# 3.3v: Pins 6, 12

# J13 Pin 01: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[1]}]
set_property PACKAGE_PIN A24 [get_ports {PMOD_J13[1]}]

# J13 Pin 02: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[2]}]
set_property PACKAGE_PIN B26 [get_ports {PMOD_J13[2]}]

# J13 Pin 03: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[3]}]
set_property PACKAGE_PIN D26 [get_ports {PMOD_J13[3]}]

# J13 Pin 04: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[4]}]
set_property PACKAGE_PIN F25 [get_ports {PMOD_J13[4]}]

# J13 Pin 07: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[7]}]
set_property PACKAGE_PIN A23 [get_ports {PMOD_J13[7]}]

# J13 Pin 08: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[8]}]
set_property PACKAGE_PIN B25 [get_ports {PMOD_J13[8]}]

# J13 Pin 09: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[9]}]
set_property PACKAGE_PIN C26 [get_ports {PMOD_J13[9]}]

# J13 Pin 10: Bank 14
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_J13[10]}]
set_property PACKAGE_PIN E26 [get_ports {PMOD_J13[10]}]


##### RASPBERRY PI CM4 GPIOs (3.3v)

# CM4 GPIO0 JP3_36  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[0]}]
set_property PACKAGE_PIN C12 [get_ports {CM4_GPIO[0]}]

# CM4 GPIO1 JP3_35  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[1]}]
set_property PACKAGE_PIN B11 [get_ports {CM4_GPIO[1]}]

# CM4 GPIO2 JP3_58  Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[2]}]
set_property PACKAGE_PIN C18 [get_ports {CM4_GPIO[2]}]

# CM4 GPIO3 JP3_56  Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[3]}]
set_property PACKAGE_PIN D18 [get_ports {CM4_GPIO[3]}]

# CM4 GPIO4 JP3_54  Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[4]}]
set_property PACKAGE_PIN E18 [get_ports {CM4_GPIO[4]}]

# CM4 GPIO5 JP3_34  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[5]}]
set_property PACKAGE_PIN C11 [get_ports {CM4_GPIO[5]}]

# CM4 GPIO6 JP3_30  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[6]}]
set_property PACKAGE_PIN D10 [get_ports {CM4_GPIO[6]}]

# CM4 GPIO7 JP3_37  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[7]}]
set_property PACKAGE_PIN B12 [get_ports {CM4_GPIO[7]}]

# CM4 GPIO8 JP3_39  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[8]}]
set_property PACKAGE_PIN A12 [get_ports {CM4_GPIO[8]}]

# CM4 GPIO9 JP3_40  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[9]}]
set_property PACKAGE_PIN D14 [get_ports {CM4_GPIO[9]}]

# CM4 GPIO10 JP3_44  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[10]}]
set_property PACKAGE_PIN C13 [get_ports {CM4_GPIO[10]}]

# CM4 GPIO11 JP3_38  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[11]}]
set_property PACKAGE_PIN D13 [get_ports {CM4_GPIO[11]}]

# CM4 GPIO12 JP3_31  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[12]}]
set_property PACKAGE_PIN A10 [get_ports {CM4_GPIO[12]}]

# CM4 GPIO13 JP3_28  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[13]}]
set_property PACKAGE_PIN E10 [get_ports {CM4_GPIO[13]}]

# CM4 GPIO14 JP3_55  Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[14]}]
set_property PACKAGE_PIN C17 [get_ports {CM4_GPIO[14]}]

# CM4 GPIO15 JP3_51  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[15]}]
set_property PACKAGE_PIN A15 [get_ports {CM4_GPIO[15]}]

# CM4 GPIO16 JP3_29  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[16]}]
set_property PACKAGE_PIN B10 [get_ports {CM4_GPIO[16]}]

# CM4 GPIO17 JP3_50  Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[17]}]
set_property PACKAGE_PIN D16 [get_ports {CM4_GPIO[17]}]

# CM4 GPIO18 JP3_49  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[18]}]
set_property PACKAGE_PIN B15 [get_ports {CM4_GPIO[18]}]

# CM4 GPIO19 JP3_26  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[19]}]
set_property PACKAGE_PIN B9 [get_ports {CM4_GPIO[19]}]

# CM4 GPIO20 JP3_27  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[20]}]
set_property PACKAGE_PIN A9 [get_ports {CM4_GPIO[20]}]

# CM4 GPIO21 JP3_25  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[21]}]
set_property PACKAGE_PIN A8 [get_ports {CM4_GPIO[21]}]

# CM4 GPIO22 JP3_46  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[22]}]
set_property PACKAGE_PIN C14 [get_ports {CM4_GPIO[22]}]

# CM4 GPIO23 JP3_47  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[23]}]
set_property PACKAGE_PIN A14 [get_ports {CM4_GPIO[23]}]

# CM4 GPIO24 JP3_45  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[24]}]
set_property PACKAGE_PIN B14 [get_ports {CM4_GPIO[24]}]

# CM4 GPIO25 JP3_41  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[25]}]
set_property PACKAGE_PIN A13 [get_ports {CM4_GPIO[25]}]

# CM4 GPIO26 JP3_24  Bank 16
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[26]}]
set_property PACKAGE_PIN C9 [get_ports {CM4_GPIO[26]}]

# CM4 GPIO27 JP3_48  Bank 15
set_property IOSTANDARD LVCMOS33 [get_ports {CM4_GPIO[27]}]
set_property PACKAGE_PIN D15 [get_ports {CM4_GPIO[27]}]


##### DDR3

# DDR3_DQ[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[0]}]
set_property SLEW FAST [get_ports {DDR3_DQ[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[0]}]
set_property PACKAGE_PIN E3 [get_ports {DDR3_DQ[0]}]

# DDR3_DQ[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[1]}]
set_property SLEW FAST [get_ports {DDR3_DQ[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[1]}]
set_property PACKAGE_PIN F2 [get_ports {DDR3_DQ[1]}]

# DDR3_DQ[2]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[2]}]
set_property SLEW FAST [get_ports {DDR3_DQ[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[2]}]
set_property PACKAGE_PIN F8 [get_ports {DDR3_DQ[2]}]

# DDR3_DQ[3]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[3]}]
set_property SLEW FAST [get_ports {DDR3_DQ[3]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[3]}]
set_property PACKAGE_PIN H3 [get_ports {DDR3_DQ[3]}]

# DDR3_DQ[4]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[4]}]
set_property SLEW FAST [get_ports {DDR3_DQ[4]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[4]}]
set_property PACKAGE_PIN H8 [get_ports {DDR3_DQ[4]}]

# DDR3_DQ[5]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[5]}]
set_property SLEW FAST [get_ports {DDR3_DQ[5]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[5]}]
set_property PACKAGE_PIN G2 [get_ports {DDR3_DQ[5]}]

# DDR3_DQ[6]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[6]}]
set_property SLEW FAST [get_ports {DDR3_DQ[6]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[6]}]
set_property PACKAGE_PIN H7 [get_ports {DDR3_DQ[6]}]

# DDR3_DQ[7]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[7]}]
set_property SLEW FAST [get_ports {DDR3_DQ[7]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[7]}]
set_property PACKAGE_PIN D7 [get_ports {DDR3_DQ[7]}]

# DDR3_DQ[8]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[8]}]
set_property SLEW FAST [get_ports {DDR3_DQ[8]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[8]}]
set_property PACKAGE_PIN C3 [get_ports {DDR3_DQ[8]}]

# DDR3_DQ[9]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[9]}]
set_property SLEW FAST [get_ports {DDR3_DQ[9]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[9]}]
set_property PACKAGE_PIN C8 [get_ports {DDR3_DQ[9]}]

# DDR3_DQ[10]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[10]}]
set_property SLEW FAST [get_ports {DDR3_DQ[10]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[10]}]
set_property PACKAGE_PIN C2 [get_ports {DDR3_DQ[10]}]

# DDR3_DQ[11]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[11]}]
set_property SLEW FAST [get_ports {DDR3_DQ[11]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[11]}]
set_property PACKAGE_PIN W3 [get_ports {DDR3_DQ[11]}]

# DDR3_DQ[12]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[12]}]
set_property SLEW FAST [get_ports {DDR3_DQ[12]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[12]}]
set_property PACKAGE_PIN A7 [get_ports {DDR3_DQ[12]}]

# DDR3_DQ[13]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[13]}]
set_property SLEW FAST [get_ports {DDR3_DQ[13]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[13]}]
set_property PACKAGE_PIN A2 [get_ports {DDR3_DQ[13]}]

# DDR3_DQ[14]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[14]}]
set_property SLEW FAST [get_ports {DDR3_DQ[14]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[14]}]
set_property PACKAGE_PIN B8 [get_ports {DDR3_DQ[14]}]

# DDR3_DQ[15]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQ[15]}]
set_property SLEW FAST [get_ports {DDR3_DQ[15]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQ[15]}]
set_property PACKAGE_PIN A3 [get_ports {DDR3_DQ[15]}]

# DDR3_ADDR[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[0]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[0]}]
set_property PACKAGE_PIN N3 [get_ports {DDR3_ADDR[0]}]

# DDR3_ADDR[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[1]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[1]}]
set_property PACKAGE_PIN P7 [get_ports {DDR3_ADDR[1]}]

# DDR3_ADDR[2]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[2]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[2]}]
set_property PACKAGE_PIN P3 [get_ports {DDR3_ADDR[2]}]

# DDR3_ADDR[3]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[3]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[3]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[3]}]
set_property PACKAGE_PIN N2 [get_ports {DDR3_ADDR[3]}]

# DDR3_ADDR[4]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[4]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[4]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[4]}]
set_property PACKAGE_PIN P8 [get_ports {DDR3_ADDR[4]}]

# DDR3_ADDR[5]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[5]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[5]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[5]}]
set_property PACKAGE_PIN P2 [get_ports {DDR3_ADDR[5]}]

# DDR3_ADDR[6]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[6]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[6]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[6]}]
set_property PACKAGE_PIN R8 [get_ports {DDR3_ADDR[6]}]

# DDR3_ADDR[7]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[7]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[7]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[7]}]
set_property PACKAGE_PIN R2 [get_ports {DDR3_ADDR[7]}]

# DDR3_ADDR[8]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[8]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[8]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[8]}]
set_property PACKAGE_PIN T8 [get_ports {DDR3_ADDR[8]}]

# DDR3_ADDR[9]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[9]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[9]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[9]}]
set_property PACKAGE_PIN R3 [get_ports {DDR3_ADDR[9]}]

# DDR3_ADDR[10]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[10]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[10]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[10]}]
set_property PACKAGE_PIN L7 [get_ports {DDR3_ADDR[10]}]

# DDR3_ADDR[11]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[11]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[11]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[11]}]
set_property PACKAGE_PIN R7 [get_ports {DDR3_ADDR[11]}]

# DDR3_ADDR[12]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[12]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[12]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[12]}]
set_property PACKAGE_PIN N7 [get_ports {DDR3_ADDR[12]}]

# DDR3_ADDR[13]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ADDR[13]}]
set_property SLEW FAST [get_ports {DDR3_ADDR[13]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ADDR[13]}]
set_property PACKAGE_PIN T3 [get_ports {DDR3_ADDR[13]}]

# DDR3_BA[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_BA[0]}]
set_property SLEW FAST [get_ports {DDR3_BA[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[0]}]
set_property PACKAGE_PIN M2 [get_ports {DDR3_BA[0]}]

# DDR3_BA[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_BA[1]}]
set_property SLEW FAST [get_ports {DDR3_BA[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[1]}]
set_property PACKAGE_PIN N8 [get_ports {DDR3_BA[1]}]

# DDR3_BA[2]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_BA[2]}]
set_property SLEW FAST [get_ports {DDR3_BA[2]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_BA[2]}]
set_property PACKAGE_PIN M3 [get_ports {DDR3_BA[2]}]

# DDR3_RAS_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_RAS_N}]
set_property SLEW FAST [get_ports {DDR3_RAS_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_RAS_N}]
set_property PACKAGE_PIN J3 [get_ports {DDR3_RAS_N}]

# DDR3_CAS_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CAS_N}]
set_property SLEW FAST [get_ports {DDR3_CAS_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_CAS_N}]
set_property PACKAGE_PIN K3 [get_ports {DDR3_CAS_N}]

# DDR3_WE_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_WE_N}]
set_property SLEW FAST [get_ports {DDR3_WE_N}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_WE_N}]
set_property PACKAGE_PIN L3 [get_ports {DDR3_WE_N}]

# DDR3_RESET_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_RESET_N}]
set_property SLEW FAST [get_ports {DDR3_RESET_N}]
set_property IOSTANDARD LVCMOS15 [get_ports {DDR3_RESET_N}]
set_property PACKAGE_PIN T2 [get_ports {DDR3_RESET_N}]

# DDR3_CKE
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CKE}]
set_property SLEW FAST [get_ports {DDR3_CKE}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_CKE}]
set_property PACKAGE_PIN L2 [get_ports {DDR3_CKE}]

# DDR3_ODT
set_property VCCAUX_IO NORMAL [get_ports {DDR3_ODT}]
set_property SLEW FAST [get_ports {DDR3_ODT}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_ODT}]
set_property PACKAGE_PIN K1 [get_ports {DDR3_ODT}]

# DDR3_DQM[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQM[0]}]
set_property SLEW FAST [get_ports {DDR3_DQM[0]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQM[0]}]
set_property PACKAGE_PIN E7 [get_ports {DDR3_DQM[0]}]

# DDR3_DQM[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQM[1]}]
set_property SLEW FAST [get_ports {DDR3_DQM[1]}]
set_property IOSTANDARD SSTL15 [get_ports {DDR3_DQM[1]}]
set_property PACKAGE_PIN D3 [get_ports {DDR3_DQM[1]}]

# DDR3_DQS_P[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_P[0]}]
set_property SLEW FAST [get_ports {DDR3_DQS_P[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[0]}]
set_property PACKAGE_PIN F3 [get_ports {DDR3_DQS_P[0]}]

# DDR3_DQS_N[0]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_N[0]}]
set_property SLEW FAST [get_ports {DDR3_DQS_N[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[0]}]
set_property PACKAGE_PIN G3 [get_ports {DDR3_DQS_N[0]}]

# DDR3_DQS_P[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_P[1]}]
set_property SLEW FAST [get_ports {DDR3_DQS_P[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_P[1]}]
set_property PACKAGE_PIN C7 [get_ports {DDR3_DQS_P[1]}]

# DDR3_DQS_N[1]
set_property VCCAUX_IO NORMAL [get_ports {DDR3_DQS_N[1]}]
set_property SLEW FAST [get_ports {DDR3_DQS_N[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_DQS_N[1]}]
set_property PACKAGE_PIN B7 [get_ports {DDR3_DQS_N[1]}]

# DDR3_CLK_P
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CLK_P}]
set_property SLEW FAST [get_ports {DDR3_CLK_P}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_CLK_P}]
set_property PACKAGE_PIN J7 [get_ports {DDR3_CLK_P}]

# DDR3_CLK_N
set_property VCCAUX_IO NORMAL [get_ports {DDR3_CLK_N}]
set_property SLEW FAST [get_ports {DDR3_CLK_N}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {DDR3_CLK_N}]
set_property PACKAGE_PIN K7 [get_ports {DDR3_CLK_N}]

