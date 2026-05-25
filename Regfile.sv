module Regfile(
	input clk, RegWen,
  	input [4:0] AddrD, AddrA, AddrB,
  	input [31:0] DataD,
  	output [31:0] DataA, DataB
);
  logic [31:0] registers [31:0];
  assign DataA = registers[AddrA];
  assign DataB = registers[AddrB];
  always_ff @(posedge clk) begin
    if(RegWen && AddrD != 0)
      registers[AddrD] <= DataD;
  end
endmodule

// Hi
