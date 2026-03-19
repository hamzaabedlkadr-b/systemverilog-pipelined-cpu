module ALU_CU(
    input logic [2:0] ALUOp,
    input logic [1:0] f2a,
    input logic [1:0] f2b,
    output logic add_sub,
    output logic [2:0] ALU_S,
	 output logic ror_en
);


always_comb begin
    // Default initialization
    add_sub=1'b0;
	 ALU_S=2'b00;
	 ror_en=1'b0;
	 

	unique case(ALUOp)
	 3'b000:begin
	     if(f2a == 2'b00 && f2b == 2'b00) begin
		  ALU_S=3'b011;//add
		   add_sub=1'b0;	
	     end else if(f2a == 2'b01 && f2b == 2'b00) begin
		  ALU_S=3'b011;//subb
		   add_sub=1'b1;
		  end else if(f2a == 2'b10 && f2b == 2'b00 ) begin
		  ALU_S=3'b000; //and 
		  end else if(f2a == 2'b11 && f2b == 2'b00) begin
		  ALU_S=3'b001;  //or
		  end else if(f2a == 2'b00 && f2b == 2'b01) begin
		  ALU_S=3'b010; //xor
		  end else if(f2a == 2'b01 && f2b == 2'b01) begin
		  ALU_S=3'b101;//slt
		   add_sub=1'b1;
		  end else if(f2a == 2'b10 && f2b == 2'b01) begin
		  ALU_S=3'b110;//sltu
		   add_sub=1'b1;
		  end else if(f2a == 2'b11 && f2b == 2'b01)begin
		  ALU_S=3'b111;//ror
		  ror_en=1'b1;
		  end	
				end 
	 3'b001:begin  
		  if(f2a == 2'b00 ) begin
		  ALU_S=3'b011;//add for LW
		   add_sub=1'b0;	
	     end else if(f2a == 2'b01 ) begin
		  ALU_S=3'b011;//addi
		   add_sub=1'b0;
		  end else if(f2a == 2'b10 ) begin
		  ALU_S=3'b000; //and 
		  end else if(f2a == 2'b11 ) begin
		  ALU_S=3'b001;  //or
		  end 
				end
	 3'b010:begin  
		  if(f2a == 2'b00 ) begin
		  ALU_S=3'b010; //xor	
	     end else if(f2a == 2'b01 ) begin
		  ALU_S=3'b101;//slt
		   add_sub=1'b1;
		  end else if(f2a == 2'b10 ) begin
		  ALU_S=3'b110;//sltu
		   add_sub=1'b1;
		  end else if(f2a == 2'b11 ) begin
		  ALU_S=3'b111;//ror
		  ror_en=1'b1;
		  end 
				end
	 3'b011:begin 
	     ALU_S=3'b011;//add for SW
		  add_sub=1'b0; 
		  end 
	 3'b100:begin 
	     ALU_S=3'b011;//subb for beq NO NEED
		  add_sub=1'b1; 
		  end 
	 3'b101:begin 
	     ALU_S=3'b011;//subb for bneq
		  add_sub=1'b1; 
		  end   
	 3'b110:begin  
		  if(f2a == 2'b00 ) begin
		  ALU_S=3'b011;//add pc + imm
		  add_sub=1'b0; 	
	//     end else if(f2a == 2'b01 ) begin
	//	  ALU_S=3'b001;//OR for LUI (or with the upper bits of the reg 
		  end 
		     end
	 3'b111:begin 
	     ALU_S=3'b100;//PASS FOR JR 
		  end 
	default: ALU_S=3'b100;
		  endcase
		  end 
		 
		    
					
					
   //     3'b000: y_comb = a & b;        // AND
    //    3'b001: y_comb = a | b;        // OR
    //   3'b010: y_comb = a ^ b;        // XOR
    //    3'b011: y_comb = s_int;        // ADD_SUbb
    //    3'b100: y_comb = b;            // PASS b
    //    3'b101: y_comb = {15'b0, signed_LT0}; // Set Less Than
    //    3'b110: y_comb = {15'b0, unsigned_LT0}; // Set Less Than unsigned
		//  3'b111: y_comb = y_shift;      // a=rs1=data_shifted b=rs2=amount_shifting	
	
endmodule 
