`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 13:56:13
// Design Name: 
// Module Name: tb_sync_ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_sync_ram;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    // Instantiate the RAM
    sync_ram #(DATA_WIDTH, ADDR_WIDTH) ram (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;

        // Write some values
        #10 we = 1; addr = 4'h1; din = 8'hAA;
        #10 addr = 4'h2; din = 8'hBB;
        #10 addr = 4'h3; din = 8'hCC;

        // Read back values
        #10 we = 0; addr = 4'h1;
        #10 addr = 4'h2;
        #10 addr = 4'h3;

        #10 $finish;
    end

endmodule