module ALU_32 (
    input logic ror_en,
    input logic [15:0] a, b, // 16-bit inputs a and b
    input logic [2:0] s,       // Operation selector
    input logic add_sub,          // Add/subtract control signal
    output logic [15:0] y_comb,y_shift,       // 32-bit output
    output logic V, Cout, Z       // Overflow, carry out, and zero flags
	 
);

// amt_in = b_in[3:0]

logic [4:0] amt;                                  // Internal shift amount
logic [15:0] s_int,b_int; 
logic Cin;                             // Internal carry-in, left arithmetic, and rotate flags
logic sum_carry_out, overflow;               // Flags for sum carry out, overflow, and less than
logic signed_LT0, unsigned_LT0;                   // Flags for signed and unsigned less than
//logic ror_en;

 // assign ror_en=1'b1 ;


// Shifter module instantiation
srl_sra_sll shifter(

 
    .a(a), 
    .amt(b), 
    .Q(y_shift),  // Output of the shifter
	 .ror_en(ror_en)
);



// Combinatorial 
always_comb begin
    // Determine b_int based on add or subtract operation
	 
    b_int = add_sub ? ~b : b;  			// If subtract, invert b
    Cin = add_sub;  							// Set carry-in for subtraction

    // Perform addition or subtraction
    {sum_carry_out, s_int} = a + b_int + Cin;
	 
    // Check for overflow
    overflow = (a[15] == b_int[15]) && (s_int[15] != a[15]);  

    // Compute signed and unsigned "less than" flags
    signed_LT0 = overflow ^ s_int[15]; 
    unsigned_LT0 = !sum_carry_out && (a < b); 
	 
    // Select signed or unsigned less than based on slt_ctl
  //  LT0 = slt_ctl ? signed_LT0 : unsigned_LT0;
    Z = (y_comb==1'b0);
	
	 
    // Perform operation based on selector s
    unique case(s)
        3'b000: y_comb = a & b;        // AND
        3'b001: y_comb = a | b;        // OR
        3'b010: y_comb = a ^ b;        // XOR
        3'b011: y_comb = s_int;        // ADD_SUbb
        3'b100: y_comb = b;            // PASS b
        3'b101: y_comb = {15'b0, signed_LT0}; // Set Less Than
        3'b110: y_comb = {15'b0, unsigned_LT0}; // Set Less Than unsigned
		  3'b111: y_comb = y_shift;      // a=rs1=data_shifted b=rs2=amount_shifting
    endcase
end

endmodule
