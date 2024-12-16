`timescale 1ns / 1ps

module alu_dec(
	input 	wire	[5:0] 	funct_i,
	input 	wire	[1:0] 	aluop_i,
	output 	reg		[2:0] 	alucontrol_o
);
	// add your code here
	always @(*) begin
		case (aluop_i)
			2'b00: alucontrol_o <= 3'b010;
			2'b01: alucontrol_o <= 3'b110;
			2'b10: begin
				case (funct_i)
					6'b100000: alucontrol_o <= 3'b010;
					6'b100010: alucontrol_o <= 3'b110;
					6'b100100: alucontrol_o <= 3'b000;
					6'b100101: alucontrol_o <= 3'b001;
					6'b101010: alucontrol_o <= 3'b111;
					default: alucontrol_o <= 3'bxxx; // default 以防万一
				endcase
			end
			default: alucontrol_o <= 3'bxxx; // default 以防万一
		endcase
	end
endmodule