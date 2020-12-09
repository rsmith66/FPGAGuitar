`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 01:47:01 PM
// Design Name: 
// Module Name: t_vga_control_sim
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


module t_vga_control_sim(

    );
    reg clk;
    reg reset;
    reg [15:0] switches = 16'b0000000000100000;
    wire [9:0] out;
    vga_control vc(.clk(clk), .reset(reset), .switches(switches), .offset_out(out));
    
    always begin
        #10 clk = ~clk;
    end
    
    initial begin
    reset = 1;
    clk = 0;
    #10 reset = 0;
    end
    
    
endmodule
