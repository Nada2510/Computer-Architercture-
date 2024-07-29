module con_logic(input logic[3:0] CondE, ALUFlagsE,FlagsE,
				logic [1:0] FlagWriteE,
				logic BranchE, RegWriteE, MemWriteE, PCSrcE,NoWriteE,clk,reset,
				output logic PCSrc, RegWrite, MemWrite,BranchTakenE,
				output logic[3:0] NextFlagsE);
logic CondEx;
//logic[3:0] Flags;
ConCheck concheck(CondE, ALUFlagsE, FlagsE, FlagWriteE, CondEx, NextFlagsE);
assign PCSrc = PCSrcE & CondEx;
assign RegWrite = RegWriteE & CondEx & (~NoWriteE);
assign MemWrite = MemWriteE & CondEx;
assign BranchTakenE = BranchE & CondEx;
endmodule
