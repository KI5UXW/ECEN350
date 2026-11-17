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

        $display("I-Type Tests");
        inst = 32'b00000000000000000000000000000000;
        extendType = 3'b000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b00000000000100000000000000000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b10000000000100000000000000000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b01111110000000000000000000000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b01111110000100000000000000000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b10010010000100000000000000000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b0000001001100000000000000000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);



        $display("S-Type Tests");
        inst = 32'b00000000000000000000000000000000;
        extendType = 3'b001;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b01111110000000000000000000000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b01111110000100000000000000000000; // Checking here that it does behave like S-type and not I-Type.
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b00000000000000000000000010000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b10000000000000000000000010000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b10000000000000000000100110000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);

        inst = 32'b01011010000000000000100110000000;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);
    

        $display("B-Type Tests");
        inst = 32'b00000000000000000000000000000000;
        extendType = 3'b010;
        #5;
        $display("extendType=%b Instr=%b extenderOut=%b", extendType, inst, extenderOut);
    end
endmodule