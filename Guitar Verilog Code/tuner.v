`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 01:41:38 PM
// Design Name: 
// Module Name: tuner
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


module tuner(
    input clk, reset,
    input[15:0] frets,
    input e, a, d, g,
    output wire speaker);
    
    reg [19:0] clkCntE, clkCntA, clkCntD, clkCntG;

    //String E
    always @ (frets) begin
        case(frets)    //Switches the user has flipped
            16'b0000000000000000 : clkCntE = 20'd606722; //E2
            16'b0000000000000001 : clkCntE = 20'd572672; //F2
            16'b0000000000000010 : clkCntE = 20'd540541; //F#2/Gb2
            16'b0000000000000100 : clkCntE = 20'd510204; //G2
            16'b0000000000001000 : clkCntE = 20'd481556; //G#2/Ab2
            16'b0000000000010000 : clkCntE = 20'd454545; //A2
            16'b0000000000100000 : clkCntE = 20'd429037; //A#2/Bb2
            16'b0000000001000000 : clkCntE = 20'd404957; //B2
            16'b0000000010000000 : clkCntE = 20'd382234; //C3
            16'b0000000100000000 : clkCntE = 20'd360776; //C#3/Db3
            16'b0000001000000000 : clkCntE = 20'd340530; //D3
            16'b0000010000000000 : clkCntE = 20'd321419; //D#3/Eb3
            16'b0000100000000000 : clkCntE = 20'd303380; //E3
            16'b0001000000000000 : clkCntE = 20'd286352; //F3
            16'b0010000000000000 : clkCntE = 20'd270270; //F#3/Gb3
            16'b0100000000000000 : clkCntE = 20'd255102; //G3
            16'b1000000000000000 : clkCntE = 20'd240790; //G#3/Ab3
            default: clkCntE = 20'd606722; //open
        endcase
    end
    
    //String A
    always @ (frets) begin
        case(frets)   //Switch flipped
            16'b0000000000000000 : clkCntA = 20'd454545; //A2
            16'b0000000000000001 : clkCntA = 20'd429037; //A#2/Bb2
            16'b0000000000000010 : clkCntA = 20'd404957; //B2
            16'b0000000000000100 : clkCntA = 20'd382234; //C3
            16'b0000000000001000 : clkCntA = 20'd360776; //C#3/Db3
            16'b0000000000010000 : clkCntA = 20'd340530; //D3
            16'b0000000000100000 : clkCntA = 20'd321419; //D#3/Eb3
            16'b0000000001000000 : clkCntA = 20'd303380; //E3
            16'b0000000010000000 : clkCntA = 20'd286352; //F3
            16'b0000000100000000 : clkCntA = 20'd270270; //F#3/Gb3
            16'b0000001000000000 : clkCntA = 20'd255102; //G3
            16'b0000010000000000 : clkCntA = 20'd240790; //G#3/Ab3
            16'b0000100000000000 : clkCntA = 20'd227273; //A3
            16'b0001000000000000 : clkCntA = 20'd214519; //A#3/Bb3
            16'b0010000000000000 : clkCntA = 20'd202478; //B3
            16'b0100000000000000 : clkCntA = 20'd191110; //C4
            16'b1000000000000000 : clkCntA = 20'd180388; //C#4/Db4
            default: clkCntA = 20'd454545; //open
        endcase
    end
    
    //String D
    always @ (frets) begin
        case(frets)   //Switch the user flipped
            16'b0000000000000000 : clkCntD = 20'd340530; //D3
            16'b0000000000000001 : clkCntD = 20'd321419; //D#3/Eb3
            16'b0000000000000010 : clkCntD = 20'd303380; //E3
            16'b0000000000000100 : clkCntD = 20'd286352; //F3
            16'b0000000000001000 : clkCntD = 20'd270270; //F#3/Gb3
            16'b0000000000010000 : clkCntD = 20'd255102; //G3
            16'b0000000000100000 : clkCntD = 20'd240790; //G#3/Ab3
            16'b0000000001000000 : clkCntD = 20'd227273; //A3
            16'b0000000010000000 : clkCntD = 20'd214519; //A#3/Bb3
            16'b0000000100000000 : clkCntD = 20'd202478; //B3
            16'b0000001000000000 : clkCntD = 20'd191110; //C4
            16'b0000010000000000 : clkCntD = 20'd180388; //C#4/Db4
            16'b0000100000000000 : clkCntD = 20'd170265; //D4
            16'b0001000000000000 : clkCntD = 20'd160705; //D#4/Eb4
            16'b0010000000000000 : clkCntD = 20'd151685; //E4
            16'b0100000000000000 : clkCntD = 20'd143172; //F4
            16'b1000000000000000 : clkCntD = 20'd135139; //F#4/Gb4
	        default: clkCntD = 20'd340530; //open
        endcase
    end
    
    //String G
    always @ (frets) begin
        case(frets)   //Switch flipped
            16'b0000000000000000 : clkCntG = 20'd255102; //G3
            16'b0000000000000001 : clkCntG = 20'd240790; //G#3/Ab3
            16'b0000000000000010 : clkCntG = 20'd227273; //A3
            16'b0000000000000100 : clkCntG = 20'd214519; //A#3/Bb3
            16'b0000000000001000 : clkCntG = 20'd202478; //B3
            16'b0000000000010000 : clkCntG = 20'd191110; //C4
            16'b0000000000100000 : clkCntG = 20'd180388; //C#4/Db4
            16'b0000000001000000 : clkCntG = 20'd170265; //D4
            16'b0000000010000000 : clkCntG = 20'd160705; //D#4/Eb4
            16'b0000000100000000 : clkCntG = 20'd151685; //E4
            16'b0000001000000000 : clkCntG = 20'd143172; //F4
            16'b0000010000000000 : clkCntG = 20'd135139; //F#4/Gb4
            16'b0000100000000000 : clkCntG = 20'd127551; //G4
            16'b0001000000000000 : clkCntG = 20'd120395; //G#4/Ab4
            16'b0010000000000000 : clkCntG = 20'd113636; //A4
            16'b0100000000000000 : clkCntG = 20'd107259; //A#4/Bb4
            16'b1000000000000000 : clkCntG = 20'd101239; //B4
            default: clkCntG = 20'd255102; //open
        endcase
    end
    
    // Create appropriate frequencies
    reg speakerE, speakerA, speakerD, speakerG;
    reg [19:0] counterE, counterA, counterD, counterG;
    
    // Tone generation for E string
    always @ (posedge clk) begin
        if (reset == 1'b1) begin
            speakerE = 0;
            counterE = 0;
        end else begin
            if (e == 1) begin
                if (counterE >= clkCntE) begin
                    speakerE <= ~speakerE;
                    counterE <= 0;
                end else begin
                    counterE <= counterE + 1;
                end
            end else begin
                speakerE = 0;
            end
        end
    end
    
    // Tone generation for A string
    always @ (posedge clk) begin
        if (reset == 1'b1) begin
            speakerA = 0;
            counterA = 0;
        end else begin
            if (a == 1) begin
                if (counterA >= clkCntA) begin
                    speakerA <= ~speakerA;
                    counterA <= 0;
                end else begin
                    counterA <= counterA + 1;
                end
            end else begin
                speakerA = 0;
            end
        end
    end
    
    // Tone generation for D string
    always @ (posedge clk) begin
        if (reset == 1'b1) begin
            speakerD = 0;
            counterD = 0;
        end else begin
            if (d == 1) begin
                if (counterD >= clkCntD) begin
                    speakerD <= ~speakerD;
                    counterD <= 0;
                end else begin
                    counterD <= counterD + 1;
                end
            end else begin
                speakerD = 0;
            end
        end
    end
    
    // Tone generation for G string
    always @ (posedge clk) begin
        if (reset == 1'b1) begin
            speakerG = 0;
            counterG = 0;
        end else begin
            if (g == 1) begin
                if (counterG >= clkCntG) begin
                    speakerG <= ~speakerG;
                    counterG <= 0;
                end else begin
                    counterG <= counterG + 1;
                end
            end else begin
                speakerG = 0;
            end
        end
    end
    
    // add together signals from all strings
    assign speaker = speakerE + speakerA + speakerD + speakerG;
                
endmodule
