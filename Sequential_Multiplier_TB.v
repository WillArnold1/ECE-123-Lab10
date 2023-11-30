`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 05:21:48 PM
// Design Name: 
// Module Name: Sequential_Multiplier_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sequential_Multiplier_TB();
  reg clk;
  reg rst;
  reg [3:0] operand_a;
  reg [3:0] operand_b;
  wire [7:0] product;

 
  Sequential_Multiplier Test_1 (.clk(clk), .rst(rst), .operand_a(operand_a), .operand_b(operand_b), .product(product) );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    rst = 1;
    operand_a = 4'b0;
    operand_b = 4'b0;
    #10 
    rst = 0;

    // multiply 10 and 6
    #100 operand_a = 4'b1010;
    operand_b = 4'b0110;

    // multiply 13 and 3
    #100 operand_a = 4'b1101;
    operand_b = 4'b0011;


    #10;
  end

endmodule


