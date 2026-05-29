module PC(
    input logic [31:0] PC_in,
    input logic clk,
    input logic rst,
    input logic PCWrite,
    output logic [31:0] PC_out
);
always_ff @(posedge clk) begin
    if(rst)
        PC_out <= 32'b0;
    else if (PCWrite)
        PC_out <= PC_in;
end
endmodule