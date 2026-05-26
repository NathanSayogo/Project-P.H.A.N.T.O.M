module ALU(
    input logic [31:0] A, B,
    input logic [3:0] ALUSel,
    output logic [31:0] result
);
always_comb begin
    // CONTROL SIGNAL : {inst[30](funct7[5]), inst[14:12](funct3)}
    case (ALUSel) 
        default: result = 32'b0;
        4'b0000: result = A + B; // ADD 
        4'b1000: result = A - B; // SUB
        4'b0100: result = A ^ B; // XOR
        4'b0110: result = A | B; // OR
        4'b0111: result = A & B; // AND
        4'b0001: result = A << B[4:0]; // Shift Left Logical (SLL)
        4'b0101: result = A >> B[4:0]; // Shift Right Logical (SRL)
        4'b1101: result = $signed(A) >>> B[4:0]; // Shift Right Arithmetic (SRA) (sign-extends if a is declared signed)
        4'b0010: result = {31'b0, $signed(A) < $signed(B)}; // Set Less Than (SLT)
        4'b0011: result = {31'b0, A < B}; // Set Less Than (Unsigned) (SLTU)
    endcase
end