`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 01:50:55 PM
// Design Name: 
// Module Name: RAM
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

module RAM(CLK, RST, Write_en, ADDR, Write_Data, Read_Data);
input CLK, RST, Write_en;
input [6:0] ADDR;
input [7:0] Write_Data;
output reg [7:0] Read_Data;

reg [7:0] mem [7:0]; //8 words each 8 bits

integer i; //loop iterator

always @ (posedge CLK) begin
	if(RST) begin //reset bits
		for(i=0; i<8; i=i+1) begin
		mem[i] <= 8'b0;
		end
	end
else begin
	if(Write_en)   //Write to the location indicated by input address
		mem[ADDR] <= Write_Data;
	else    //read from the word indicated by the input address
		Read_Data <= mem[ADDR];
	end
end
endmodule


