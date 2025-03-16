
# 20 MHz from Y3
set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS15} [get_ports CLK20_VCXO]
create_clock -period 50.000 -name clk20_vcxo [get_ports CLK20_VCXO]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK20_VCXO]
set_property -dict {PACKAGE_PIN V9 IOSTANDARD LVCMOS15} [get_ports VCXO_EN]

# UART to USB
# TxD and RxD directions are from the perspective of the USB/UART chip.
#set_property -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS25} [get_ports FPGA_TxD]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS25} [get_ports FPGA_RxD]

# LEDs
set_property -dict {PACKAGE_PIN Y13 IOSTANDARD LVCMOS15} [get_ports LD16]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS15} [get_ports LD17]

# Miscellaneous
# Bank 0 setup
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Compress image
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]











