module mux4to1 (
    input logic [1:0] select,    
    input logic [15:0] in0,      
    input logic [15:0] in1,      
    input logic [15:0] in2,
    input logic [15:0] in3,	 
    output logic [15:0] out       
);

   
    always_comb begin
        case (select)
            2'b00: out = in0;  // Select input 0
            2'b01: out = in1;  // Select input 1
            2'b10: out = in2;  // Select input 2
				2'b11: out = in3;  // select input 3
            default: out = 16'b0;
        endcase
    end
endmodule
