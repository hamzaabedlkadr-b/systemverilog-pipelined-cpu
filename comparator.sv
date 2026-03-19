module comparator(input logic [15:0] data1,
						input logic [15:0] data2,
						output logic equ
						);
	always_comb begin 
	
	
	equ =(data1==data2) ;
	end 
	endmodule 
	