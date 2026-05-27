module MUX2to1(
    input logic [31:0] A, B,
    input logic sel,
    output logic [31:0] result
);
assign result = sel ? A : B;
endmodule