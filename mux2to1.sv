module mux2to1 (
    input logic select,    
    input logic [15:0] in0,      
    input logic [15:0] in1,   
    output logic [15:0] out       
);

    always_comb begin
        case (select)
            1'b0: out = in0;  // Select input 0
            1'b1: out = in1;  // Select input 1
            default: out = 16'b0;
        endcase
    end
endmodule