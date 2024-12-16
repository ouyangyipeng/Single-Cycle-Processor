`timescale 1ns / 1ps
// flopr 模块是一个带有复位功能的边沿触发寄存器。
// 它在时钟信号的下降沿或复位信号的上升沿进行操作。
// 该模块的参数 WIDTH 定义了数据位宽。

// 端口说明：
// clk：时钟信号。
// rst：复位信号。
// d：输入数据。
// q：输出数据。
// 当复位信号 rst 为高电平时，输出 q 被重置为 0。否则，在时钟信号的下降沿，输入数据 d 被传递到输出 q。


module flopr #(parameter WIDTH = 8)(
	input 	wire 				clk,rst,
	input 	wire	[WIDTH-1:0] d,
	output 	reg		[WIDTH-1:0] q
    );
	always @(negedge clk,posedge rst) begin
		if(rst) begin
			q <= 0;
		end else begin
			q <= d;
		end
	end
endmodule
