module ALU_decoder (input logic[5:0] Funct,
				           	logic            ALUOp,
					          output logic [1:0] FlagW,
					          logic[2:0] ALUControl,
					          logic NoWrite);
always_comb
	if(ALUOp) begin //which DP Instr?
		NoWrite = 0;
		casex(Funct[4:0])
			5'b0100x: ALUControl = 3'b000; //ADD
			5'b0010x: ALUControl = 3'b101; //SUB
			5'b0000x: ALUControl = 3'b010; //AND
			5'b1100x: ALUControl = 3'b011; //ORR
			5'b1110x: ALUControl = 3'b110; //BIC
			5'b0001x: ALUControl = 3'b111; //EOR
			5'b10101: 					  //CPM
				begin
					ALUControl = 3'b101; 
					NoWrite = 1;
				end
			default: ALUControl = 3'bx;	 //unimplemented
		endcase
		// update flags if S bit is set (C & V only for arith)
		FlagW[1] = Funct[0];
		FlagW[0] = Funct[0] & ~ALUControl[1];
	end 
	else begin
		ALUControl  = 3'b000; 	// add for non-DP instruction
		FlagW = 2'b00;			// don't update Flags
	end
endmodule
