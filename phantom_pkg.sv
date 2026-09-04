package phantom_pkg;

    typedef struct packed {
        logic [31:0] pc;
        logic [31:0] pc_plus_4;
        logic [31:0] inst;
    } if_id_t;

// ---- Control signal bundle (decoded in ID, rides the pipeline) ----
    typedef struct packed {
        logic        RegWEn;     // 1 = write rd
        logic        ASel;       // 0 = rs1, 1 = PC
        logic        BSel;       // 0 = rs2, 1 = imm
        logic [3:0]  ALUSel;     // ALU operation (1111 = pass-B for LUI)
        logic        MemRW;      // 0 = read, 1 = write (DMEM)
        logic [1:0]  WBSel;      // 0 = mem, 1 = ALU, 2 = PC+4
        logic        BrUn;       // 1 = unsigned branch compare
        logic        is_branch;  // 1 = branch instruction (PCSel resolved in EX)
        logic        is_jump;    // 1 = JAL/JALR (unconditional PCSel=1)
        logic [2:0]  funct3;     // for EX-stage branch condition select
    } ctrl_t;

endpackage

