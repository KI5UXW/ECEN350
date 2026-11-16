`timescale 1ns / 1ps

module testSignExtender;
    reg  [31:0] Instruction;
    reg  [1:0]  SignOp;
    wire [63:0] SignExOut;
    reg  [63:0] expected;
    integer i, t, errors;

    SignExtender uut(.SignExOut(SignExOut), .Instruction(Instruction), .SignOp(SignOp));

    initial begin
        $dumpfile("signext.vcd");
        $dumpvars(0, testSignExtender);
        errors = 0;

        for (t = 0; t < 4; t = t + 1) begin
            SignOp = t[1:0];
            for (i = 0; i < 100; i = i + 1) begin
                Instruction = $random;          // 32-bit random truncated to 26 bits
                #5;
                // Independent reference model using $signed arithmetic
                case (SignOp)
                    2'b00: expected = {52'b0, Instruction[21:10]};
                    2'b01: expected = $signed({{55{Instruction[20]}}, Instruction[20:12]});
                    2'b10: expected = $signed({{45{Instruction[23]}}, Instruction[23:5]}) <<< 2;
                    2'b11: expected = $signed({{38{Instruction[25]}}, Instruction[25:0]}) <<< 2;
                endcase
                if (SignExOut !== expected) begin
                    errors = errors + 1;
                    $display("ERROR: SignOp=%b Instr=%h got=%h expected=%h",
                             SignOp, Instruction, SignExOut, expected);
                end
            end
        end
        $display("SignExtender test done: %0d errors", errors);
        $finish;
    end
endmodule