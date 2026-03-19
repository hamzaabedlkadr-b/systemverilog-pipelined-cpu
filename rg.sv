module rg(
    input logic clk, rst, en,
    input logic [15:0] dataIn,
    output logic [15:0] dataOut
);

    always_ff @(posedge clk) begin
        if (rst)
            dataOut <= 16'b0; 
        else if (en)          
            dataOut <= dataIn;
    end
endmodule