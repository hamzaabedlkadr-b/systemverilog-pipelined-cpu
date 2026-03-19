module mux2to1bit (
    input logic select,    
    input logic  in0,      
    input logic  in1,   
    output logic  out       
);

    always_comb begin
        case (select)
            1'b0: out = in0;  // Select input 0
            1'b1: out = in1;  // Select input 1
            default: out = 1'b0;
        endcase
    end
endmodule