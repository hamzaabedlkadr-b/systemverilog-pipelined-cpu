module bunit (
    input logic beq, bne, jal, jr, equ,
    output logic branch
);
initial begin 
branch=1'b0;
end 
// Combinational logic to determine the branch signal
always_comb begin
    branch = (beq && equ) || (bne && !equ) || jal || jr;
end

endmodule
