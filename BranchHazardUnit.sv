module BranchHazardUnit(input logic ID_EX_MemRead, beq, bne, jr, output logic FLUSH, ENABLE);

always_comb begin
	FLUSH = 1'b0;
	ENABLE = 1'b0;
	if(ID_EX_MemRead && ((beq)  || (bne) || jr)) begin
				FLUSH = 1'b1;
				ENABLE = 1'b1;
	end
end
endmodule