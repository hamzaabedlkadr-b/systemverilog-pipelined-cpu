module register0 (
    input logic clk, rst, en,
    input logic [15:0] dataIn,
    output logic [15:0] dataOut
);

    always_ff @(posedge clk) begin
            dataOut <= 16'b0; 
    end
endmodule