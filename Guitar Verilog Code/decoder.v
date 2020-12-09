module decoder(
    input clk, reset,
    input [16:0] switches,
    output wire [16:0] frets
    );
   
    reg [16:0] fretOut;
   
    always @ (clk) begin
        if (reset == 1'b1) begin  //if reset is activated
            fretOut = 0;
        end else begin
            casex (switches) //casex to assign which fret is played
                16'b0000000000000000 : fretOut = 16'b0000000000000000;
                16'bxxxxxxxxxxxxxxx1 : fretOut = 16'b0000000000000001;
                16'bxxxxxxxxxxxxxx10 : fretOut = 16'b0000000000000010;
                16'bxxxxxxxxxxxxx100 : fretOut = 16'b0000000000000100;
                16'bxxxxxxxxxxxx1000 : fretOut = 16'b0000000000001000;
                16'bxxxxxxxxxxx10000 : fretOut = 16'b0000000000010000;
                16'bxxxxxxxxxx100000 : fretOut = 16'b0000000000100000;
                16'bxxxxxxxxx1000000 : fretOut = 16'b0000000001000000;
                16'bxxxxxxxx10000000 : fretOut = 16'b0000000010000000;
                16'bxxxxxxx100000000 : fretOut = 16'b0000000100000000;
                16'bxxxxxx1000000000 : fretOut = 16'b0000001000000000;
                16'bxxxxx10000000000 : fretOut = 16'b0000010000000000;
                16'bxxxx100000000000 : fretOut = 16'b0000100000000000;
                16'bxxx1000000000000 : fretOut = 16'b0001000000000000;
                16'bxx10000000000000 : fretOut = 16'b0010000000000000;
                16'bx100000000000000 : fretOut = 16'b0100000000000000;
                16'b1000000000000000 : fretOut = 16'b1000000000000000;
            endcase
        end
    end
   
    assign frets = fretOut;
endmodule