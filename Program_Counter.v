module program_counter(
	input clk,
	input areset,
	input load,
	input [31:0] ImmExt,
	input PCSrc,
	output reg [31:0] PC
);

wire [31:0] PCNext;
always @(posedge clk or negedge areset) begin
	if (!areset) begin
		PC <= 0;
	end 
	else begin
            	PC <= (load) ? PCNext : PC;
	end
end

assign PCNext = (PCSrc) ? PC + ImmExt : PC + 4;
endmodule
