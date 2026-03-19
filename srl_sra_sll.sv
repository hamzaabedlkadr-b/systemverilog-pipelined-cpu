module srl_sra_sll(
  //  input logic l_r, 
  //  input logic l_a, 
	 input logic ror_en,
    input logic [15:0] a,
    input logic [15:0] amt,
    output logic [15:0] Q
);

logic signed [31:0] K ,L, M, N, O; 
//delete 
//function automatic logic [15:0] reverse_bits(input logic [15:0] data);

  //  integer i;
  //  logic [15:0] reversed_data;
  //  for (i = 0; i < 16; i = i + 1) begin
    //    reversed_data[i] = data[15-i];
    //end
   // return reversed_data;
	 
//endfunction



always_comb begin 
  //  logic l_a_real;
  //  l_a_real = l_r ? 0 : l_a;
    
	 if (ror_en) begin
    K = {a,a};
    end else begin
	 K = a;
	 end

  //  if (l_r) begin
  //      K = reverse_bits(a); 
  //  end
    
    L = amt[0] ? (K >> 1) : K;
    M = amt[1] ? (L >> 2) : L;
    N = amt[2] ? (M >> 4) : M;
    O = amt[3] ? (N >> 8) : N;
 //  L = amt[0] ? ((l_a_real) ? (K >>> 1) : (K >> 1)) : K;
 //   M = amt[1] ? ((l_a_real) ? (L >>> 2) : (L >> 2)) : L;
 //   N = amt[2] ? ((l_a_real) ? (M >>> 4) : (M >> 4)) : M;
 //   O = amt[3] ? ((l_a_real) ? (N >>> 8) : (N >> 8)) : N;
    
   // if (l_r) begin
   //     Q = reverse_bits(O); 
   // end else begin
        Q = (O[15:0]);
   // end
end

endmodule 