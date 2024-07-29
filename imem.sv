module imem(input logic [31:0] a,
            output logic [31:0] rd);
logic [31:0] RAM[2097151:0];
initial
    $readmemh("G:\Documents\CIE_439\projects\memfile.txt",RAM);
assign rd = RAM[a[22:2]]; // word aligned
endmodule
