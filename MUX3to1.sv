module MUX3to1(
    input logic [31:0] A, B, C
    input logic [1:0] sel,
    output logic [31:0] result
);
always_comb begin
    case(sel)
        2'b00: result = A;
        2'b01: result = B;
        2'b10: result = C;
        default: result = 0;
    endcase
endmodule