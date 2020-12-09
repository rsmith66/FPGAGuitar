`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 03:50:15 PM
// Design Name: 
// Module Name: guitar
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


module guitar(
    // General I/0
    input CLK, RST_BTN,
    
    // Decoder I/0
    input [15:0] switches,
    input wire [3:0] buttons, //BTNU, BTND, BTNR, BTNC,
    
    // Tuner I/O
    output wire AUD_PWM, AUD_SD,
    
    // VGA I/O
    output wire VGA_HS, VGA_VS,
    output wire [3:0] VGA_R, VGA_G, VGA_B  
    
    );
        
    // Local Values
    wire [16:0] frets_wire;
    reg [16:0] frets;

    assign AUD_SD = 1;    

    decoder d(.clk(CLK), .reset(RST_BTN), .switches(switches), .frets(frets_wire));
    
    always @ (CLK) begin
        frets = frets_wire;
    end
    
    // Tuner
    tuner t(.clk(CLK), .reset(RST_BTN), .frets(frets), .e(buttons[0]), .a(buttons[1]), 
        .d(buttons[2]), .g(buttons[3]), .speaker(AUD_PWM));
    
    // VGA controller
    vga_control vc(.clk(CLK), .reset(RST_BTN), .switches(frets), .buttons(buttons), 
        .hsync(VGA_HS), .vsync(VGA_VS), .vga_r(VGA_R), .vga_g(VGA_G), .vga_b(VGA_B));

endmodule
