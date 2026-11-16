`define I_imm 3'b000
`define S_imm 3'b001
`define B_imm 3'b010
`define U_imm 3'b011
`define J_imm 3'b100

module signExtender(
    output reg [31:0] extenderOut,
    input [2:0] extendType,
    input [0]  SignOp,
    input [31:0]  inst //[31:7] are the operands & [6:0] is the opcode.
);
    always @(*) 
        begin
            case (extendType)
                `I_imm: {21{inst[31]}, inst[30:25], inst[24:21], inst[20]};
                `S_imm: {21{inst[31]}, inst[30:25], inst[11:8], inst[7]};
                `B_imm: {20{inst[31]}, inst[7], inst[30:25], inst[11:8], 1{1'b0}};
                `U_imm: {inst[31], inst[30:20], inst[19:12], 12{1'b0}}
                `J_imm: {12{inst[31]}, inst[19:12], inst[20], inst[24:21], 1{1'b0}};
                default: extenderOut = 32'b0;
            endcase
        end
endmodule