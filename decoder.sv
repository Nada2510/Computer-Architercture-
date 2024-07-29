module decoder(input logic[1:0] Op,
			logic[5:0] Funct,
			logic[3:0] Rd,
			output logic[1:0] FlagW,
			logic PCS, RegW, MemW, Branch,
			logic MemtoReg, ALUSrc,NoWrite,
			logic[1:0] ImmSrc, RegSrc,
			logic[2:0] ALUControl);
// Main Decoder
logic ALUOp;
main_decoder md (Op, Funct, RegW, MemW, MemtoReg, ALUSrc, Branch, ALUOp, ImmSrc, RegSrc);

// ALU Decoder
ALU_decoder alud(Funct,ALUOp,FlagW,ALUControl,NoWrite);

// PC logic
PC_logic pcl(RegW,Rd,PCS);

endmodule
