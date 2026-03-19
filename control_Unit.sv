	module control_Unit(input logic [2:0] opcode, 
							input logic [1:0] f2a, 
							output logic RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR,
							output logic MemtoReg);
always_comb begin

{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b000000000;
	case(opcode) 
	3'b000:
		{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b100000001; //all R-format
	3'b001: begin 
		if(f2a != 2'b00)
			{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b110000001; //I-format Type 1
		else 
			{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b110100000; //load
		end
	3'b010:
		{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b110000001; //I-format Type 2
	3'b011:
		{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b011000000; //S format
	3'b100:
		{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b000010000; //beq
	3'b101:
		{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b000001000; //bne
	3'b110: 

			{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b110000101; //Jal

	3'b111:
		{RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b000000011; //Jr jal with x0
	default: {RegWrite, ALUSrc, MemWrite, MemRead, beq, bne, JAL, JR, MemtoReg} = 9'b000000000; 
	endcase
	end 
endmodule