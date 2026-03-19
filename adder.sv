module adder(
  input [15:0] p,
  input [15:0] q,
  output [15:0] out);
  
  assign out = p+q;
endmodule
