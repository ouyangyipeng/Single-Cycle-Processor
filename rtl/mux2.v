`timescale 1ns / 1ps
// mux2 模块是一个多路复用器（Multiplexer），它根据选择信号 s 的值，在两个输入数据 d0 和 d1 之间进行选择，并将选中的数据输出到 y。
// 这个模块的参数 WIDTH 定义了输入和输出数据的位宽。


module mux2 #(parameter WIDTH = 8)(
	input 	wire[WIDTH-1:0] d0,d1,
	input 	wire 			s,
	output 	wire[WIDTH-1:0] y
    );
	assign y = s ? d1 : d0;

endmodule
