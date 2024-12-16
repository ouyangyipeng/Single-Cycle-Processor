`timescale 1ns / 1ps

// mips 模块是一个简化的 MIPS 处理器的顶层模块。它包含了控制器和数据路径两个子模块，并通过这些子模块实现了 MIPS 指令的执行。

// 该模块的端口包括：
// clk：时钟信号。
// rst：复位信号。
// pc：程序计数器输出。
// instr：指令输入。
// memwrite：内存写使能信号。
// aluout：ALU 输出。
// writedata：写入数据。
// readdata：读取数据。
// ra_debug：调试读取地址。
// ra_debug_data：调试读取数据。

// 该模块通过 controller 和 datapath 子模块来实现 MIPS 指令的控制和数据处理。


module mips(
	input 	wire 		clk,rst,
	output 	wire[31:0] 	pc,
	input 	wire[31:0] 	instr,
	output 	wire 		memwrite,
	output 	wire[31:0] 	aluout,writedata,
	input 	wire[31:0] 	readdata,
	//add debug port 
	input 	wire[4:0] 	ra_debug,
	output 	wire[31:0] 	ra_debug_data
    );
	
	wire 				memtoreg,alusrc,regdst,regwrite,jump,pcsrc,zero,overflow;
	wire[2:0] 			alucontrol;

	controller c(
		instr[31:26],
		instr[5:0],
		zero,
		memtoreg,
		memwrite,
		pcsrc,
		alusrc,
		regdst,
		regwrite,
		jump,
		alucontrol
	);

	
	//datapath dp(clk,rst,memtoreg,pcsrc,alusrc,
	//regdst,regwrite,jump,alucontrol,overflow,zero,pc,instr,aluout,writedata,readdata);
	datapath dp(
		clk,
		rst,
		memtoreg,
		pcsrc,
		alusrc,
		regdst,
		regwrite,
		jump,
		alucontrol,
		overflow,
		zero,
		pc,
		instr,
		aluout,
		writedata,
		readdata,
		ra_debug,
		ra_debug_data
	);
endmodule
