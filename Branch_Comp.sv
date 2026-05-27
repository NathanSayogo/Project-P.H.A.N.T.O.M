module Branch_Comp(
    input logic [31:0] DataA, DataB,
    input logic BrUn,
    output logic BrEq, BrLT
);

always_comb begin
    case (BrUn)
        default: begin
            BrEq = 1'b0;
            BrLT = 1'b0;
        end
        1'b0: begin
            BrEq = ($signed(DataA) == $signed(DataB));
            BrLT = ($signed(DataA) < $signed(DataB));
        end
        1'b1: begin
            BrEq = (DataA == DataB);
            BrLT = (DataA < DataB);
        end
    endcase
end
endmodule