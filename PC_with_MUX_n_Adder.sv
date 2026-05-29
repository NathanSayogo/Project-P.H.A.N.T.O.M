module PC_with_MUX_n_Adder(
    input logic [31:0] ALU, 
    input logic clk,
    input logic rst,
    input logic PCWrite, PCSel,
    output logic [31:0] PC_out, PC_plus_4
);
logic [31:0] PC_in;

MUX2to1 PC_MUX(
    .A(ALU),
    .B(PC_plus_4),
    .sel(PCSel),
    .result(PC_in)
);

PC Flop(
    .PC_in(PC_in),
    .clk(clk),
    .rst(rst),
    .PCWrite(PCWrite),
    .PC_out(PC_out)
);

assign PC_plus_4 = PC_out + 32'b100;

endmodule