module controlUnit(input logic [2:0] opcode, input logic [1:0] f2a, output logic RegWrite, ALUSrc, MemWrite, MemRead,
						MemtoReg, branch, output logic [2:0] ALUOp);

always_comb 
	case(opcode)
	3'b000:{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b100000000; //all R-format
	3'b001: begin 
		if(f2a != 3'b01)
			{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b110000001; //I-format Type 1
		else 
			{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b110110001; //load
		end
	3'b010:{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b110000001; //I-format Type 2
	3'b011:{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b011000010; //S format
	3'b100:{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b000001011; //beq
	3'b101:{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b000001011; //bne
	3'b110: begin 
		if(f2a != 3'b01)
			{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b110001100; //Jal
		else 
			{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b110000101; //Lui
		end
	3'b111:{RegWrite, ALUSrc, MemWrite, MemRead, MemtoReg, branch, ALUOp} = 9'b110001100; //Jr jal with x0
endcase
endmodule