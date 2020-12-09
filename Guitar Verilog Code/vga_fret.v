`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 02:04:33 PM
// Design Name: 
// Module Name: vga_fret
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


module vga_fret(
    input [9:0] xoffset, yoffset,    // Top left corner (x,y)
    input [9:0] x, y,
    output wire dispValOut
    );
    
    assign dispValOut = ((x > xoffset) & (x < 4 + xoffset) & (y > yoffset) & (y < 150 + yoffset)) ? 1 : 0;
    
endmodule
