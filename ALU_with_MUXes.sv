module ALU_with_MUXes(
    input logic [31:0] PC, rs1, rs2, imm,
    input logic Asel, Bsel,
    input logic [3:0] ALUSel,
    output logic [31:0] result
);
    logic [31:0] InputA, InputB; 
    MUX2to1 MUX_A(
        .A(PC),
        .B(rs1),
        .sel(Asel),
        .result(InputA)
    );
    MUX2to1 MUX_B(
        .A(imm),
        .B(rs2),
        .sel(Bsel),
        .result(InputB)
    );
    ALU EX_ALU(
        .A(InputA),
        .B(InputB),
        .ALUSel(ALUSel),
        .result(result)
    );
endmodule