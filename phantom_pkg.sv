package phantom_pkg;
    typedef struct packed {
        logic [31:0] pc;
        logic [31:0] pc_plus_4;
        logic [31:0] inst;
    } if_id_t;
endpackage

