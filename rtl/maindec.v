`timescale 1ns / 1ps

module main_dec(
	input 	wire	[5:0] 		op_i,

	output 	wire 				memtoreg_o,
	output 	wire  				memwrite_o,
	output 	wire 				branch_o,
	output 	wire 				alusrc_o,
	output 	wire 				regdst_o,
	output 	wire 				regwrite_o,
	output 	wire 				jump_o,
	output 	wire	[1:0] 		aluop_o
);
    reg regwrite;
    reg regdst;
    reg alusrc;
    reg branch;
    
    reg memwrite;
    reg memtoreg;
    reg [1:0]aluop;
    reg jump;
	// add your code here
    always@(*) begin
        regwrite <= 0;
        regdst <= 0;
        alusrc <= 0;
        branch <= 0;
        memwrite <= 0;
        memtoreg <= 0;
        aluop <= 2'b00;
        jump <= 0;

        case(op_i)
            6'b000000: begin
                regwrite <= 1;
                regdst <= 1;
                aluop <= 2'b10;
            end
            
            6'b100011: begin
                regwrite <= 1;
                alusrc <= 1;
                memtoreg <= 1;
            end
            
            6'b101011: begin
                alusrc <= 1;
                memwrite <= 1;
            end
            
            6'b000100: begin
                alusrc <= 0;
                branch <= 1;
                aluop <= 2'b01;
            end
            
            6'b001000: begin
                regwrite <= 1;
                alusrc <= 1;
            end
            
            6'b000010: begin
                jump <= 1;
            end
        endcase
    end
    
    assign regwrite_o = regwrite;
    assign regdst_o = regdst;
    assign alusrc_o = alusrc;
    assign branch_o = branch;
    assign memwrite_o = memwrite;
    assign memtoreg_o = memtoreg;
    assign aluop_o = aluop;
    assign jump_o = jump;
endmodule

