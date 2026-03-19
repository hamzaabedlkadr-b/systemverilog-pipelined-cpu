
module BranchForwardingUnit (
    //input logic bebnjr,
    input logic EX_MEM_RegWr,      // RegWrite signal for EX/MEM pipeline register
    input logic MEM_WB_RegWr,      // RegWrite signal for MEM/WB pipeline register4
	 input logic ID_EX_RegWr,
	 input logic [2:0] ID_EX_Rd,
    input logic [2:0] EX_MEM_Rd,   // Destination register for EX/MEM stage
    input logic [2:0] MEM_WB_Rd,   // Destination register for MEM/WB stage
  
	 input logic [2:0] IF_ID_Rs1,   // Source register 1 for ID/EX stage
    input logic [2:0] IF_ID_Rs2,   // Source register 2 for ID/EX stage

	 input logic  beq, bne, jr,
    //input logic ID_EX_MemWrite,    // Memory write signal for ID/EX stage (indicates store instruction)
    //input logic [2:0] EX_MEM_Rs2,  // Source register 2 for the MEM stage (for store forwarding)
    output logic [1:0] FB1,   // Forwarding control signal for ALU input A
    output logic [1:0] FB2   // Forwarding control signal for ALU input B
);

// check for 2 things: add then store - load then store

    always_comb begin
        // Default forwarding values (no forwarding)
        FB1 = 2'b00;
        FB2 = 2'b00;
		  
		  if ((beq)  || (bne) || jr) begin
			  // Forwarding logic for ALU input A (ID/EX.Rs1) - FOR R FORMAT
			  if ((ID_EX_RegWr 
							&& (ID_EX_Rd != 0) 
							&& (ID_EX_Rd == IF_ID_Rs1))) begin
					FB1 = 2'b01; // Forward data from EX/MEM stage
			  end 
			  	  else if (EX_MEM_RegWr
							&& (EX_MEM_Rd != 0) 
							&& !(ID_EX_RegWr 
									&& (ID_EX_Rd != 0)
									&& (ID_EX_Rd == IF_ID_Rs1)) 
							&& (EX_MEM_Rd == IF_ID_Rs1)) begin
					FB1 = 2'b10; 
			  end
			  else if (MEM_WB_RegWr 
							&& (MEM_WB_Rd != 0) 
							&& !(EX_MEM_RegWr 
									&& (EX_MEM_Rd != 0)
									&& (EX_MEM_Rd == IF_ID_Rs1)) 
							&& (MEM_WB_Rd == IF_ID_Rs1)) begin
					FB1 = 2'b11; 
			  end		

			  if ((ID_EX_RegWr 
							&& (ID_EX_Rd != 0) 
							&& (ID_EX_Rd == IF_ID_Rs2))) begin
					FB2 = 2'b01; // Forward data from EX/MEM stage
			  end 
			  	  else if (EX_MEM_RegWr
							&& (EX_MEM_Rd != 0) 
							&& !(ID_EX_RegWr 
									&& (ID_EX_Rd != 0)
									&& (ID_EX_Rd == IF_ID_Rs2)) 
							&& (EX_MEM_Rd == IF_ID_Rs2)) begin
					FB2 = 2'b10; 
			  end
			  else if (MEM_WB_RegWr 
							&& (MEM_WB_Rd != 0) 
							&& !(EX_MEM_RegWr 
									&& (EX_MEM_Rd != 0)
									&& (EX_MEM_Rd == IF_ID_Rs2)) 
							&& (MEM_WB_Rd == IF_ID_Rs2)) begin
					FB2 = 2'b11; 
			  end		
		
		 end
		 end

endmodule
