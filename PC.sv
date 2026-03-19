module PC(
    input logic clk, rst, en,
    input logic [15:0] dataIn,
    output logic [15:0] dataOut
);

    always_ff @(posedge clk) begin
        if (rst)
            dataOut <= 16'b0; 
        else if (en == 0)          
            dataOut <= dataOut;
		  else if (en == 1)
		      dataOut <= dataIn;
			
    end
endmodule