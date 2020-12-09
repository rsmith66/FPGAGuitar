`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 02:11:21 PM
// Design Name: 
// Module Name: tuner_divideby12
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


module tuner_divideby12( input[5:0] n, //numerator
    output reg[2:0] result, //quotient
    output[3:0] r); //remainder
    
    reg[3:0] r_bit3_bit2;
    
    assign r = {r_bit3_bit2, n[1:0]}; //dividing by 4 first, removes 2 bits from numerator
    
    always@(n[5:2]) //dividing the rest of the numerator by 3
    case(n[5:2])
        0: begin result = 0; r_bit3_bit2=0; end
        1: begin result = 0; r_bit3_bit2=1; end
        2: begin result = 0; r_bit3_bit2=2; end
        3: begin result = 1; r_bit3_bit2=0; end
        4: begin result = 1; r_bit3_bit2=1; end
        5: begin result = 1; r_bit3_bit2=2; end
        6: begin result = 2; r_bit3_bit2=0; end
        7: begin result = 2; r_bit3_bit2=1; end
        8: begin result = 2; r_bit3_bit2=2; end
        9: begin result = 3; r_bit3_bit2=0; end
        10: begin result = 3; r_bit3_bit2=1; end
        11: begin result = 3; r_bit3_bit2=2; end
        12: begin result = 4; r_bit3_bit2=0; end
        13: begin result = 4; r_bit3_bit2=1; end
        14: begin result = 4; r_bit3_bit2=2; end
        15: begin result = 5; r_bit3_bit2=0; end
    endcase
    
endmodule






