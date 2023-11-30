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


module Sequential_Multiplier(clk, rst, operand_a, operand_b, product);
input clk, rst;
input [3:0] operand_a;
input [3:0] operand_b;
output reg [7:0] product;

reg [7:0] partial_product;
reg [2:0] shift_count;
reg [3:0] multiplicand;  
reg [3:0] operand_bb;    

// Define states
parameter S0_idle = 0, S1_multiply = 1, S2_update_result = 2;
reg [2:0] CS, NS;

always @(posedge clk) begin
  if (rst == 1)
    CS <= S0_idle; // When reset=1, reset the CS of the FSM to "S0"
  else
    CS <= NS; // Otherwise, next CS
end

always @(CS, rst) begin
  case (CS)
    S0_idle: begin
      partial_product <= 8'b0;
      shift_count <= 3'b0;
      multiplicand <= {4'b0, operand_a};
      operand_bb <= operand_b;
      NS = S1_multiply;
    end

    S1_multiply: begin
      if ((operand_bb[0] == 0) && (shift_count < 4)) begin
        partial_product <= partial_product;
        shift_count <= shift_count + 3'b1;
        multiplicand <= multiplicand << 1;
        operand_bb <= operand_bb >> 1;
      end
      else if ((operand_bb[0] == 1) && (shift_count < 4)) begin
        partial_product <= partial_product + multiplicand;
        shift_count <= shift_count + 3'b1;
        multiplicand <= multiplicand << 1;
        operand_bb <= operand_bb >> 1;
      end
      NS = S2_update_result;
    end

    S2_update_result: begin
      if (shift_count == 4) begin
        NS = S0_idle;
        product <= partial_product;
      end
      else begin
        NS = S1_multiply;
      end
    end
  endcase
end



endmodule
