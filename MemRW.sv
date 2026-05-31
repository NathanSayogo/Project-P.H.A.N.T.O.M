module DMEM(
    input  logic clk,
    input  logic MemRead,
    input  logic MemWrite,
    input  logic [31:0] addr,
    input  logic [31:0] writeData,
    output logic [31:0] readData
);

    logic [31:0] mem [255:0]; // 256 words of memory

    // READ (combinational)
    assign readData = (MemRead) ? mem[addr[9:2]] : 32'hx;

    // WRITE (sequential)
    always_ff @(posedge clk) begin
        if (MemWrite)
            mem[addr[9:2]] <= writeData;
    end

endmodule