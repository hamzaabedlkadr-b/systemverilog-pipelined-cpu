module ME_WB (

  input logic clk,reset,flush, MEM_WBen,
  input logic EX_MEM_RegWr,
  input logic [15:0] Mem_Data_in, 
  input logic [15:0] ALU_result_in, 
  
  input logic [2:0] EX_MEM_rd,
  input logic [15:0] PC4_in,
  input logic  wbmux,

  
  input logic RegWrite_in, 
  
  output logic RegWrite_out,
  output logic  wbmuxout,
  output logic [15:0] PC4_out,
  
  output logic [15:0] Mem_Data_out,
  output logic [15:0] ALU_result_out,
  output logic [2:0] MEM_WB_rd,
  output logic MEM_WB_RegWr

);
  
  always @ (posedge clk)
    begin
      if (reset == 1'b1 || flush == 1'b1)
        begin
          PC4_out <= 16'b0;
          Mem_Data_out <= 16'b0;
          ALU_result_out <= 16'b0;
          MEM_WB_rd <= 3'b0;

 
			 wbmuxout <= 1'b0;
          RegWrite_out <= 1'b0;
			 MEM_WB_RegWr <= 1'b0;
          
        end
		 else if (MEM_WBen == 1'b0) 
			begin
			 
			 PC4_out <= PC4_out;
          Mem_Data_out <= Mem_Data_out;
          ALU_result_out <= ALU_result_out;
          MEM_WB_rd <= MEM_WB_rd;

 
			 wbmuxout <= wbmuxout;
          RegWrite_out <= RegWrite_out;
			 MEM_WB_RegWr <= MEM_WB_RegWr;
			end
			
       else if (MEM_WBen == 1'b1)
         begin
          PC4_out <= PC4_in;
          Mem_Data_out <= Mem_Data_in;
          ALU_result_out <= ALU_result_in;
          MEM_WB_rd <= EX_MEM_rd;
			
 
			 wbmuxout <= wbmux ;
          RegWrite_out <= RegWrite_in;
			 MEM_WB_RegWr <= EX_MEM_RegWr; 

        end
    end
endmodule