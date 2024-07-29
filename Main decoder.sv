module main_decoder(input logic[1:0] Op,
			logic[5:0] Funct,
			output logic RegW, MemW,
			logic MemtoReg, ALUSrc, Branch, ALUOp,
			logic[1:0] ImmSrc, RegSrc);
logic[9:0] controls;
always_comb
		case(Op)
		// Data-processing immediate
			2'b00: if(Funct[5]) controls = 10'b0000101001;
		// Data-processting register
		else controls = 10'b0000001001;
		// LDR
			2'b01: if(Funct[0]) controls = 10'b0001111000;
		// STR
		else controls = 10'b1001100100;
		// B
			2'b10:	begin
					controls = 10'b0110100010;
					end
		//Unimplemented
			default: controls = 10'bx;
		endcase
assign {RegSrc, ImmSrc, ALUSrc, MemtoReg, RegW, MemW, Branch, ALUOp} = controls;
endmodule
