`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 03:36:44 PM
// Design Name: 
// Module Name: ROM_TB
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


module ROM_TB();
reg [2:0] ROM_addr;
wire [3:0] ROM_data;

ROM testROM(.ROM_addr(ROM_addr), .ROM_data(ROM_data));

integer i;
 initial begin
    for ( i = 0; i < 8; i = i + 1) begin
      ROM_addr = i;
      #10; 
    end

    
 endmodule
