`timescale 1ns / 1ps

module clk_div(
    input clk,
    input rst,
    output reg div_clki
);
    reg [5:0] count = 0;
    reg rst_sync = 0;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            rst_sync <= 0;
            count <= 0;
            div_clki <= 0;
        end else begin
            rst_sync <= 1;
            if (count == 24) begin
                div_clki <= ~div_clki;
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule