`timescale 1ns / 1ps

// top 模块是整个设计的顶层模块，它实例化了 MIPS 处理器、指令存储器（inst_mem）和数据存储器（data_mem）。

// 该模块的端口包括：
// clk：时钟信号。
// rst：复位信号。
// writedata：写入数据。
// dataadr：数据地址。
// memwrite：内存写使能信号。
// ra_debug：调试读取地址。
// ra_debug_data：调试读取数据。

// 内部信号包括：
// pc：程序计数器。
// instr：指令。
// readdata：读取数据。

// 该模块通过实例化 mips 模块来实现处理器的功能，并通过 inst_mem 和 data_mem 模块来实现指令存储和数据存储。


module top(
	input 	wire 		clk,rst,
	output 	wire[31:0] 	writedata,dataadr,
	output 	wire 		memwrite,
	input 	wire[4:0] 	ra_debug,
	output 	wire[31:0] 	ra_debug_data,pc,instr
    );

	wire	[31:0] 		readdata;

	//mips mips(clk,rst,pc,instr,memwrite,dataadr,writedata,readdata);
	mips mips(
		clk,
		rst,
		pc,
		instr,
		memwrite,
		dataadr,
		writedata,
		readdata,
		ra_debug,
		ra_debug_data
	);
    //create imem and dmem by yourself
	inst_mem imem(
		clk,
		pc[7:2],
		instr
	);
	data_mem dmem(
		~clk,
		memwrite,
		dataadr,
		writedata,
		readdata
	);
endmodule
