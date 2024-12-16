`timescale 1ns / 1ps

// regfile 模块是一个寄存器文件（Register File），用于存储和读取寄存器数据。
// 有以下端口：
// clk：时钟信号。
// we3：写使能信号，当为高电平时允许写入数据。
// ra1、ra2：读取地址，用于指定要读取的寄存器。
// wa3：写入地址，用于指定要写入的寄存器。
// wd3：写入数据。
// rd1、rd2：读取数据，分别对应 ra1 和 ra2 指定的寄存器。
// ra_debug：调试读取地址。
// ra_debug_data：调试读取数据，对应 ra_debug 指定的寄存器。


module regfile(
	input 	wire 		clk,
	input 	wire 		we3,
	input 	wire[4:0] 	ra1,ra2,wa3,
	input 	wire[31:0] 	wd3,
	output 	wire[31:0] 	rd1,rd2,
	//add one more port here
	input 	wire[4:0] 	ra_debug,
	output 	wire[31:0] 	ra_debug_data
    );

	reg 	[31:0] 		rf[31:0];

	always @(posedge clk) begin
		if(we3) begin
			 rf[wa3] <= wd3;
		end
	end

	assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
	assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
	//add one more port here for debug at run-time
	assign ra_debug_data = (ra_debug != 0) ? rf[ra_debug] : 0;
endmodule
