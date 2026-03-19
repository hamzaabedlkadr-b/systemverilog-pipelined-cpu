module ForwardingUnit (
    //input logic bebnjr,
    input logic EX_MEM_RegWr,      // RegWrite signal for EX/MEM pipeline register
    input logic MEM_WB_RegWr,      // RegWrite signal for MEM/WB pipeline register
    input logic [2:0] EX_MEM_Rd,   // Destination register for EX/MEM stage
    input logic [2:0] MEM_WB_Rd,   // Destination register for MEM/WB stage
    input logic [2:0] ID_EX_Rs1,   // Source register 1 for ID/EX stage
    input logic [2:0] ID_EX_Rs2,   // Source register 2 for ID/EX stage
    //input logic ID_EX_MemWrite,    // Memory write signal for ID/EX stage (indicates store instruction)
    //input logic [2:0] EX_MEM_Rs2,  // Source register 2 for the MEM stage (for store forwarding)
    output logic [1:0] ForwardA,   // Forwarding control signal for ALU input A
    output logic [1:0] ForwardB   // Forwarding control signal for ALU input B
);

// check for 2 things: add then store - load then store

    always_comb begin
        // Default forwarding values (no forwarding)
        ForwardA = 2'b00;
        ForwardB = 2'b00;
		  
        // Forwarding logic for ALU input A (ID/EX.Rs1) - FOR R FORMAT
        if (EX_MEM_RegWr 
				&& (EX_MEM_Rd != 0) 
				&& (EX_MEM_Rd == ID_EX_Rs1)) begin
            ForwardA = 2'b01; // Forward data from EX/MEM stage
        end 
		  
		  // FOR LOAD INSTRUCTIONS
		  else if (MEM_WB_RegWr 
						&& (MEM_WB_Rd != 0) 
						&& !(EX_MEM_RegWr 
								&& (EX_MEM_Rd != 0)
								&& (EX_MEM_Rd == ID_EX_Rs1)) 
						&& (MEM_WB_Rd == ID_EX_Rs1)) begin
            ForwardA = 2'b10; // Forward data from MEM/WB stage
        end

        // Forwarding logic for ALU input B (ID/EX.Rs2) - FOR R FORMAT
        if (EX_MEM_RegWr 
				&& (EX_MEM_Rd != 0) 
				&& (EX_MEM_Rd == ID_EX_Rs2)) begin
            ForwardB = 2'b01; // Forward data from EX/MEM stage
        end
		  
		  // FOR LOAD INSTRUCTIONS
		  else if (MEM_WB_RegWr 
						&& (MEM_WB_Rd != 0) 
						&& !(EX_MEM_RegWr 
								&& (EX_MEM_Rd != 0)
								&& (EX_MEM_Rd == ID_EX_Rs2)) 
						&& (MEM_WB_Rd == ID_EX_Rs2)) begin
            ForwardB = 2'b10; // Forward data from MEM/WB stage
        end
		  
    end

endmodule