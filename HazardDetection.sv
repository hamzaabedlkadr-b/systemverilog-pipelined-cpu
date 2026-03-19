module HazardDetection
    (input logic [2:0] IF_ID_RS1,
     input logic [2:0] IF_ID_RS2,
     input logic [2:0] ID_EX_rd,
     input logic ID_EX_MemRead,
     output logic PC_en, IF_ID_en, ID_EX_flush
    );

    assign PC_en = (ID_EX_MemRead ) ? (((ID_EX_rd == IF_ID_RS1) || (ID_EX_rd == IF_ID_RS2)) & ID_EX_rd != 0) : 0;
	 assign IF_ID_en = (ID_EX_MemRead ) ? (((ID_EX_rd == IF_ID_RS1) || (ID_EX_rd == IF_ID_RS2)) & ID_EX_rd!= 0): 0;
	 assign ID_EX_flush = (ID_EX_MemRead) ? (((ID_EX_rd == IF_ID_RS1) || (ID_EX_rd == IF_ID_RS2)) & ID_EX_rd!= 0) : 0;

endmodule