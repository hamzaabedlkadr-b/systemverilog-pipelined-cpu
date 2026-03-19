module rom
  #(
    parameter WIDTH = 16,
    parameter DEPTH = 64,
    parameter DEPTH_LOG = $clog2(DEPTH)
  )
  (
    input logic clk,
    input logic [15:0] addr_rd,
    output reg [WIDTH-1:0] data_out
  );

  // Declare the RAM array
  reg [WIDTH-1:0] rom [0:DEPTH-1];

  // Load the ROM contents from the repository root.
  initial begin
    $readmemh("rom_init.hex", rom, 0, DEPTH-1);
  end

  // Read is synchronous
  always @ (posedge clk) begin
    data_out <= rom[addr_rd];
  end
endmodule 
