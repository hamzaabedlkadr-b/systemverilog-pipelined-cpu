module IF_ID
  (
    input logic clk,
    input logic reset,
    input logic [15:0] instruction_in,
    input logic [15:0] PC, 
	 input logic [15:0] PC4, 
    input logic flush, 
    input  logic IFIDen, 
    output logic [15:0] instruction_out,
    output logic [15:0] PC_ID,
	 output logic [15:0] PC4_ID
	
  );
  always @(posedge clk)
    begin
      if (reset == 1'b1 || flush == 1'b1)
        begin
          instruction_out <= 16'b0;
          PC_ID <= 16'b0;
			 PC4_ID <= 16'b0;
        end
      else if (IFIDen == 1'b0)
        begin
          instruction_out <= instruction_out;
           PC_ID <= PC_ID;
			 PC4_ID <= PC4_ID;
        end
		  else if (IFIDen == 1'b1)
        begin
          instruction_out <= instruction_in;
           PC_ID <= PC;
			 PC4_ID <= PC4;
        end
    end
endmodule