`timescale 1ns / 1ps
`define I_imm 3'b000
`define S_imm 3'b001
`define B_imm 3'b010
`define U_imm 3'b011
`define J_imm 3'b100


module testSignExtender;
    reg  [31:0] inst;
    reg  [2:0]  extendType;
    wire [31:0] extenderOut;
    integer i, t;

    signExtender uut(.extenderOut(extenderOut), .inst(inst), .extendType(extendType));

    initial begin
        $dumpfile("signext.vcd");
        $dumpvars(0, testSignExtender);

        for (t = 0; t < 4; t = t + 1) begin
            extendType = t[2:0];
            for (i = 0; i < 5; i = i + 1) begin
                inst = $random;          // 32-bit random truncated to 26 bits
                #5;
                $display("SignOp=%b Instr=%b got=%b", extendType, inst, extenderOut);
            end
        end
    end
endmodule