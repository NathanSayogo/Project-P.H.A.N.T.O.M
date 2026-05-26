module Regfile(
	input logic clk, RegWen,
  	input logic [4:0] AddrD, AddrA, AddrB,
  	input logic [31:0] DataD,
  	output logic [31:0] DataA, DataB
);
  logic [31:0] registers [31:0];
  assign DataA = registers[AddrA];
  assign DataB = registers[AddrB];
  always_ff @(posedge clk) begin
    if(RegWen && AddrD != 0)
      registers[AddrD] <= DataD;
  end
endmodule
