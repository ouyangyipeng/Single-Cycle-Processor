`timescale 1ns / 1ps
// signext 模块是一个符号扩展模块，它将 16 位输入信号 a 扩展为 32 位输出信号 y。
// 符号扩展的过程是将输入信号的最高有效位（即符号位）复制到扩展的高 16 位，从而保持符号的一致性。


module signext(
	input 	wire[15:0] a,
	output 	wire[31:0] y
    );

	assign y = {{16{a[15]}},a};
endmodule
