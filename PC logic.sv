module PC_logic(input logic RegW,
				logic[3:0] Rd,
				output logic PCS);
assign PCS = ((Rd == 4'b1111) & RegW);
endmodule