module ImmediateGenUnit (
    input logic [15:0] instruction, // 16-bit input instruction
    output logic [15:0] immediate   // 16-bit output immediate
);

    logic [2:0] opcode;
    logic [4:0] imm5;
    logic [9:0] imm10;
    logic [1:0] imm4_3;  // the upper immediate of SB-type
    logic [2:0] imm2_0;  // the lower immediate of SB-type

    assign opcode = instruction[2:0];       // Opcode is always in bits [2:0]
    assign imm5 = instruction[15:11];       // Immediate field for I-type (5 bits)
    assign imm10 = instruction[15:6];       // Immediate field for JL-type (10 bits)
    assign imm4_3 = instruction[15:14];     // Upper immediate bits [4:3] for SB-type
    assign imm2_0 = instruction[5:3];       // Lower immediate bits [2:0] for SB-type

    always_comb begin
        // Default case
        immediate = 16'b0;
        
        unique case (opcode)
            3'b001, 3'b010: begin
                // I-type
                immediate = {{11{imm5[4]}}, imm5};
            end
            3'b100, 3'b101, 3'b011: begin
                // SB-type 
                immediate = {{11{imm4_3[1]}}, imm4_3, imm2_0}; 
            end
            3'b110: begin
                // JL-type
                immediate = {{6{imm10[9]}}, imm10[9], imm10[4:0], imm10[8:5]}; 
            end
            default: begin
                // R-type && JR-type
                immediate = 16'b0;
            end
        endcase
    end

endmodule










