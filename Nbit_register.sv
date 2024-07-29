module NReg #(parameter N = 2)
	(input logic[N-1:0] in,logic enable,clk,reset,flush,
	output logic[N-1:0] out);
always_ff @(posedge clk, posedge reset)
begin
	if (reset | flush)		out <= 0;
	else if(enable) out <= in;
end

endmodule