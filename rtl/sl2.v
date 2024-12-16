`timescale 1ns / 1ps
// sl2 模块是一个简单的逻辑左移模块，它将输入信号 a 左移 2 位，并将结果输出到 y。
// 具体来说，它将输入的低 30 位移到高 30 位，并在低 2 位填充 0。
// 这个模块通常用于地址计算中的偏移操作。


module sl2(
	input 	wire[31:0] a,
	output 	wire[31:0] y
    );

	assign y = {a[29:0],2'b00};
endmodule
