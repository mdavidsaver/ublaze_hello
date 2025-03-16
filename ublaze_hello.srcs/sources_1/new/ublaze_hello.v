`timescale 1ns / 1ps

module ublaze_hello(
    output wire VCXO_EN, // 20MHz
    input wire CLK20_VCXO,
    output wire FPGA_RxD,
    output wire LD16
    );

assign VCXO_EN = 1'b1;
wire clk20 = CLK20_VCXO;

ps_1 ps_1_i(
    .clk20(clk20),
    .uart_0_txd(FPGA_RxD),
    .locked(LD16)
);

endmodule
