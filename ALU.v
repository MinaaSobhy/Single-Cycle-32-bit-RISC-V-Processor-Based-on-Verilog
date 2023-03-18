// This module represents an Arithmetic Logic Unit (ALU) which performs different operations on two input operands
// The input operands are two 32-bit registers ScrA and ScrB
// The output operands are a 32-bit ALUResult and two flags ZeroFlag and SignFlag
module ALU (
	input [31:0]SrcA,
	input [31:0]SrcB,
	input [2:0]ALUControl,
	output reg [31:0]ALUResult,
	output reg ZeroFlag,
	output reg SignFlag
);

// The always block executes whenever there is a change in the input signals
always@(*)
begin 
	case (ALUControl)
	// Add operation
	3'b000: ALUResult = SrcA + SrcB ; 
	
	// Shift left operation
	3'b001: ALUResult = SrcA << SrcB ;
	
	// Subtract operation 
	3'b010: ALUResult = SrcA - SrcB ;

	// Bitwise XOR operation
	3'b100: ALUResult = SrcA ^ SrcB ;

	// Shift right operation
	3'b101: ALUResult = SrcA >> SrcB ;
 
	// Bitwise OR operation
	3'b110: ALUResult = SrcA | SrcB ;

	// Bitwise AND operation
	3'b111: ALUResult = SrcA & SrcB ;

	// Default case
	default: ALUResult = 0;
        endcase

	// The ZeroFlag indicates whether the ALUResult is zero or not
	ZeroFlag = ALUResult? 0:1;

	// The SignFlag indicates whether the ALUResult is negative or not
	SignFlag = ALUResult[31]? 1:0;

end
endmodule




