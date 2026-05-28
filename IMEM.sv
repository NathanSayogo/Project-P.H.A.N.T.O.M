module IMEM(
    input logic [31:0] addr,
    output logic [31:0] inst
);

    logic [31:0] mem [255:0];

    initial begin
        $readmemh("program.hex", mem);
    end

    assign inst = mem[addr[9:2]];
    
endmodule