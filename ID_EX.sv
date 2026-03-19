module ID_EX (


  input logic clk,reset,flush,ID_EXen,
  input logic IF_ID_RegWr,
  input logic [15:0] rs1_in,
  input logic [15:0] rs2_in, 
  input logic RegWrite_in,
  input logic [15:0] imm_data_in,
  
  input logic [2:0] IF_ID_rs1,
  input logic [2:0] IF_ID_rs2,
  input logic [2:0] IF_ID_rd,
  
  input logic [15:0] PC4_in,
  
  input logic JAL_in,
  
  input logic MemRead_in, MemWrite_in, AluSrc_in, //logicwrite_in,
  input logic  wbmux,
  input logic [15:0] instruction_in,
  
  
  
  output logic [15:0] instruction_out,
  output logic MemRead_out, MemWrite_out, AluSrc_out, // logicwrite_out,
  output logic ID_EX_RegWr,
  output logic [15:0] PC4_out,
  output logic  wbmux_out,
  output logic [2:0] ID_EX_rs1,
  output logic [2:0] ID_EX_rs2,
  output logic [2:0] ID_EX_rd,
  output logic [15:0] imm_data_out,
  output logic [15:0] rs1_out, 
  output logic [15:0] rs2_out, 
  output logic JAL_out,
  output logic RegWrite_out
 
);
  
  always @ (posedge clk)
    begin
      if (reset == 1'b1 || flush == 1'b1)
        begin
		    RegWrite_out <= 1'b0;
          PC4_out <= 16'b0;
          rs1_out <= 16'b0;
          rs2_out <= 16'b0;
          ID_EX_rd <= 3'b0;
          imm_data_out <= 16'b0;
          ID_EX_rs1 <= 3'b0;
          ID_EX_rs2 <= 3'b0;
			 MemRead_out <= 1'b0;
          wbmux_out <= 1'b0;
          MemWrite_out <= 1'b0;
         // logicwrite_out <= 1'b0;
          AluSrc_out <= 1'b0;
			 instruction_out <= 16'b0;
			 JAL_out <= 1'b0;
          ID_EX_RegWr <= 1'b0;
        end
      else if (ID_EXen == 1'b0)
		begin
		    RegWrite_out <= RegWrite_out;
			 PC4_out <= PC4_out;
          rs1_out <= rs1_out;
          rs2_out <= rs2_out;
          ID_EX_rd <= ID_EX_rd;
          imm_data_out <= imm_data_out;
          ID_EX_rs1 <= ID_EX_rs1;
			 ID_EX_rs2 <= ID_EX_rs2;
          ID_EX_RegWr <= ID_EX_RegWr ;
          MemRead_out <= MemRead_out;
          wbmux_out <= wbmux_out;
          MemWrite_out <= MemWrite_out;
         // logicwrite_out <= logicwrite_in;
			 JAL_out <= JAL_out;
          AluSrc_out <= AluSrc_out;
			instruction_out <= instruction_out;
		  
		end 
		else if (ID_EXen ==1'b1)
        begin
		    RegWrite_out <= RegWrite_in;
		    ID_EX_RegWr <= IF_ID_RegWr ;
          PC4_out <= PC4_in;
          rs1_out <= rs1_in;
          rs2_out <= rs2_in;
          ID_EX_rd <= IF_ID_rd;
          imm_data_out <= imm_data_in;
          ID_EX_rs1 <= IF_ID_rs1;
			 ID_EX_rs2 <= IF_ID_rs2;
          
          MemRead_out <= MemRead_in;
          wbmux_out <= wbmux;
          MemWrite_out <= MemWrite_in;
         // logicwrite_out <= logicwrite_in;
			 JAL_out <= JAL_in;
          AluSrc_out <= AluSrc_in;
			instruction_out <= instruction_in;
        
        end
    end
endmodule 