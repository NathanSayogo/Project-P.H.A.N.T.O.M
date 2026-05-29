module IF_before_PRs(
    input logic [31:0] ALU,
    input logic clk,
    input logic rst,
    input logic PCWrite, PCSel,
    output logic [31:0] PC_out, PC_plus_4, inst
);
    logic [31:0] PC_in_IMEM;

    PC_with_MUX_n_Adder PCWMNA(
        .ALU(ALU),
        .clk(clk),
        .rst(rst),
        .PCWrite(PCWrite),
        .PCSel(PCSel),
        .PC_out(PC_out),
        .PC_plus_4(PC_plus_4)
    );

    assign PC_in_IMEM = PC_out;

    IMEM imem(
        .addr(PC_in_IMEM),
        .inst(inst)
    );

endmodule