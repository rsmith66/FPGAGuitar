`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 02:04:33 PM
// Design Name: 
// Module Name: vga_string
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


module vga_string(
    input [9:0] yoffset,    // Top left corner (x,y)
    input [9:0] x, y,
    input reset, clk, vibrate,
    output wire dispValOut
    );
    
    // Create a clock for vibrating string
    reg pix_stb;
    localparam constantNumber = 1666667;
    reg [31:0] count; 
    always @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1'b1)
            count <= 32'b0;
        else if (count == constantNumber - 1)
            count <= 32'b0;
        else
            count <= count + 1;
    end
    always @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1'b1)
            pix_stb <= 1'b0;
        else if (count == constantNumber - 1)
            pix_stb <= ~pix_stb;
        else
            pix_stb <= pix_stb;
    end
    
    // Subtle string vibration if activated
    reg [1:0] oscilate;
    always @ (posedge pix_stb) begin
        if (vibrate == 1'b0) begin
            oscilate = 2'b00;
        end else begin
            oscilate = oscilate + 2'b10;
        end
    end
    
    // Assign output
    assign dispValOut = ((y > yoffset + oscilate) & (y < 4 + yoffset + oscilate)) ? 1 : 0;
endmodule
