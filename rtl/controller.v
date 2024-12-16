`timescale 1ns / 1ps
//不用动


module controller(
	input 	wire	[5:0] 	op_i,
	input 	wire	[5:0]	funct_i,
	input 	wire 			zero_i,
	output 	wire 			memtoreg_o,
	output 	wire 			memwrite_o,
	output 	wire 			pcsrc_o,
	output 	wire 			alusrc_o,
	output 	wire 			regdst_o,
	output 	wire 			regwrite_o,
	output 	wire 			jump_o,
	output 	wire	[2:0] 	alucontrol_o
);
	
	wire			[1:0] 	aluop;
	wire 					branch;

	main_dec u_md(
		.op_i		(op_i),
		.memtoreg_o	(memtoreg_o),
		.memwrite_o	(memwrite_o),
		.branch_o	(branch),
		.alusrc_o	(alusrc_o),
		.regdst_o	(regdst_o),
		.regwrite_o	(regwrite_o),
		.jump_o		(jump_o),
		.aluop_o	(aluop)
	);

	alu_dec u_ad(
		.funct_i 		(funct_i),
		.aluop_i		(aluop),
		.alucontrol_o	(alucontrol_o)
	);

	assign pcsrc_o = branch & zero_i;

endmodule
