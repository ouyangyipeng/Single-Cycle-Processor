`timescale 1ns / 1ps
// datapath 模块是一个数据路径模块，用于实现 MIPS 处理器的数据处理部分。它接收控制信号和数据输入，并输出处理结果。

// 该模块的端口包括：
// clk：时钟信号。
// rst：复位信号。
// memtoreg、pcsrc、alusrc、regdst、regwrite、jump：控制信号。
// alucontrol：ALU 控制信号。
// overflow、zero：ALU 状态信号。
// pc：程序计数器。
// instr：指令输入。
// aluout：ALU 输出。
// writedata：写入数据。
// readdata：读取数据。
// ra_debug：调试读取地址。
// ra_debug_data：调试读取数据。

// 该模块通过组合逻辑和时序逻辑实现指令的执行和数据的处理。


module datapath(
	input wire clk,rst,
	input wire memtoreg,pcsrc,
	input wire alusrc,regdst,
	input wire regwrite,jump,
	input wire[2:0] alucontrol,
	output wire overflow,zero,
	output wire[31:0] pc,
	input wire[31:0] instr,
	output wire[31:0] aluout,writedata,
	input wire[31:0] readdata,
	//
	input wire[4:0] ra_debug,
	output wire[31:0] ra_debug_data
);
	
	// 线路部分
    wire [31:0] pc_next, pc_plus4, pc_branch, pc_jump, pc_new;
    wire [31:0] signimm, signimmsh;// 立即与扩展
    wire [31:0] srca, srcb;
    wire [31:0] result;
    wire [4:0] writereg;
    wire [31:0] writedata_wire;

    // PC部分------------------------------------------------
    assign pc_jump = {pc_plus4[31:28], instr[25:0], 2'b00};
    
    flopr #(32) pc_reg(
        .clk(clk),
        .rst(rst),
        .d(pc_new),
        .q(pc)
    );

    // 下一条指令的 PC 值
    assign pc_plus4 = pc + 4;
    sl2 immsh(
        .a(signimm),
        .y(signimmsh)
    );// 进行信号扩展
    assign pc_branch = pc_plus4 + signimmsh;// 跳转

    // MUX for PC
    mux2 #(32)pc_mux(
        .s(pcsrc),
        .d1(pc_plus4),
        .d0(pc_branch),
        .y(pc_next)
    );

    // MUX for PC j
    mux2 #(32) pc_jump_mux(// 原本传入的是pc next，但是发现还要加一个这个jump，所以最后新增了个new
        .s(jump),
        .d1(pc_jump),
        .d0(pc_next),
        .y(pc_new)
    );
    // PC部分------------------------------------------------

    sl2 sl2_signimm(
        .a(signimm),
        .y(signimmsh)
    );

    adder pc_branch_adder(
        .a(pc_plus4),
        .b(signimmsh),
        .y(pc_branch)
    );

    // 寄存器文件
    regfile rf(
        .clk(clk),
        .we3(regwrite),
        .ra1(instr[25:21]),
        .ra2(instr[20:16]),
        .wa3(writereg),
        .wd3(result),
        .rd1(srca),
        .rd2(writedata_wire),
        .ra_debug(ra_debug),
        .ra_debug_data(ra_debug_data)
    );

    // 符号扩展
    signext se(
        .a(instr[15:0]),
        .y(signimm)
    );

    // ALU
    alu alu(
        .a(srca),
        .b(srcb),
        .alucontrol(alucontrol),
        .result(aluout),
        .zero(zero),
        .overflow(overflow)
    );

    // MUX for ALU source operand
    mux2 #(32) alu_src_mux(
        .s(alusrc),
        .d1(writedata_wire),
        .d0(signimmsh),
        .y(srcb)
    );
    assign writedata = writedata_wire;

    // MUX for register destination number
    // assign writereg = regdst ? instr[15:11] : instr[20:16];
    mux2 #(5) reg_dst_mux(
        .s(regdst),
        .d1(instr[15:11]),
        .d0(instr[20:16]),
        .y(writereg)
    );

    // MUX for data to write to register file
    //assign result = memtoreg ? readdata : aluout;
    mux2 #(32) mem_to_reg_mux(
        .s(memtoreg),
        .d1(readdata),
        .d0(aluout),
        .y(result)
    );

endmodule
