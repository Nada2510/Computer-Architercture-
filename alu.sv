module alu(input logic [31:0] a, b,
           input logic [1:0] ALUControl,
           output logic [31:0] Result,
           output logic [3:0] Flags);
logic neg, zero, carry, overflow;
logic [31:0] condinvb;
logic [32:0] sum;
assign condinvb = ALUControl[0] ? ~b : b;
assign sum = a + condinvb + ALUControl[0];
always_comb
casex (ALUControl[1:0])
           2'b0?: Result = sum;
           2'b10: Result = a & b;
           2'b11: Result = a | b;
endcase
assign neg = Result[31];
assign zero = (Result == 32'b0);
assign carry = (ALUControl[1] == 1'b1) & sum[32];
assign overflow = (ALUControl[1] == 1'b1) & ~(a[31] ^ b[31] ^
ALUControl[0]) &
(a[31] ^ sum[31]);
assign Flags = {neg, zero, carry, overflow};
endmodule

