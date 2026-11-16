`define I_imm 3'b000
`define S_imm 3'b001
`define B_imm 3'b010
`define U_imm 3'b011
`define J_imm 3'b100

module signExtender(
    output reg [31:0] extenderOut,
    input [2:0] extendType,
    input [0]  SignOp
    input [31:0]  Instruction //[31:7] are the operands & [6:0] is the opcode.
);
    always @(*) 
        begin
            case (extendType)
                `I_imm: {{55{Instruction[20]}}, Instruction[20:12], };
                `S_imm:
                `B_imm:
                `U_imm:
                `J_imm:
                default: extenderOut = 64'b0;
            endcase
        end


endmodule