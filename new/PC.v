`timescale 1ns / 1ps

module PC(
    input clk,
    input rst,
    input Proc_run_en,
    input Proc_reset,
    output reg [31:0] pc_o
    );
    
    initial begin
        pc_o <= 32'b0;
    end
    
    always @(posedge clk or posedge Proc_reset) begin
        if (Proc_reset) begin
            pc_o <= 32'b0;
        end else if (rst) begin
            pc_o <= 32'b0;
        end else if (Proc_run_en) begin
            pc_o <= pc_o + 4;
        end
    end
endmodule
