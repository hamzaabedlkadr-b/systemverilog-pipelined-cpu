module EX_MEM (
  input logic [15:0] ID_EX_rs2,
  input logic clk,reset,flush, EX_MEMen,
  input logic [15:0] ALU_Result_in,
  input logic [15:0] Write_Data_in, 
  input logic [2:0] ID_EX_rd,  
  input logic [15:0] PC4_in,
  input logic MemRead_in,MemWrite_in, RegWrite_in, //from control unit
  input logic  wbmux,


  output logic MemRead_out, MemWrite_out, RegWrite_out,
  output logic [15:0] PC4_out,
  output logic [15:0] ALU_Result_out,
  output logic [2:0] EX_MEM_rd,
  output logic [15:0] Write_Data_out,
  output logic wbmux_out,
  output logic [15:0] EX_MEM_rs2

);
  

  always @ (posedge clk)
    begin
      if (reset == 1'b1 || flush == 1'b1)
        begin
		    EX_MEM_rs2 <= 16'b0;
          PC4_out <= 16'b0;
          ALU_Result_out <= 16'b0;
          EX_MEM_rd <= 3'b0;
          Write_Data_out <= 16'b0;
			 MemRead_out <= 1'b0;
          wbmux_out <= 1'b00;
          MemWrite_out <= 1'b0;
          RegWrite_out <= 1'b0;
        end
		  
		else if (EX_MEMen == 1'b0)
			begin
			 PC4_out <= PC4_out;
          ALU_Result_out <= ALU_Result_out;
          EX_MEM_rd <= EX_MEM_rd;
          Write_Data_out <= Write_Data_out;
			 MemRead_out <= MemRead_out;
          wbmux_out <= wbmux_out;

          MemWrite_out <= MemWrite_out;

          RegWrite_out <= RegWrite_out;
          EX_MEM_rs2 <= EX_MEM_rs2;
			end

      else if (EX_MEMen == 1'b1)

			begin

          PC4_out <= PC4_in;

          ALU_Result_out <= ALU_Result_in;

          EX_MEM_rd <= ID_EX_rd;

          Write_Data_out <= Write_Data_in;

          MemRead_out <= MemRead_in;

          wbmux_out <= wbmux;

          MemWrite_out <= MemWrite_in;

          RegWrite_out <= RegWrite_in;
          EX_MEM_rs2 <= ID_EX_rs2; 
        end

    end

endmodule