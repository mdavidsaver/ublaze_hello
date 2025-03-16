//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Sun Mar 16 11:36:54 2025
//Host        : kat24 running 64-bit Debian GNU/Linux 12 (bookworm)
//Command     : generate_target ps_1_wrapper.bd
//Design      : ps_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ps_1_wrapper
   (clk20,
    uart_0_txd);
  input clk20;
  output uart_0_txd;

  wire clk20;
  wire uart_0_txd;

  ps_1 ps_1_i
       (.clk20(clk20),
        .uart_0_txd(uart_0_txd));
endmodule
