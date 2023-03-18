module instruction_memory(
	input [31:0] PC, 
	output reg [31:0] Instr
);

reg [31:0] mem[63:0]; 

initial
begin
$readmemh("1st_program.txt",mem);
end

always @(*)
begin
	Instr = mem[PC[31:2]];
end

endmodule
