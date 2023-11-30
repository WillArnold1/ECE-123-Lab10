`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 04:49:34 PM
// Design Name: 
// Module Name: RAM_TB
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

module RAM_TB;
reg CLK, RST, Write_en;
reg [6:0] ADDR;
reg [7:0] Write_Data;
wire [7:0] Read_Data;

RAM RAM_TEST (.CLK(CLK),.RST(RST),.Write_en(Write_en),.ADDR(ADDR),.Write_Data(Write_Data),.Read_Data(Read_Data));

  
always begin
   #5 CLK = ~CLK;
end

initial begin
    CLK = 0;
    RST = 1;
    Write_en = 0;
    ADDR = 0;
    Write_Data = 8'b0;

    #10 RST = 0;

// Write 
    #10 
    Write_en = 1;
    Write_Data = 8'b11011011;
    ADDR = 3;
    #10
    Write_en = 1;
    Write_Data = 8'b10101010;
    ADDR = 7;

// Read 
    #10 
    Write_en = 0;
    ADDR = 3;
    #10 
    ADDR = 7;
end

endmodule

