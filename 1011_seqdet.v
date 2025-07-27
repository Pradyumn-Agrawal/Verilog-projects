`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2025 19:56:29
// Design Name: 
// Module Name: 1011_seqdet
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


module seq_1011_det(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
reg [1:0] PS,NS;

always@(posedge clk or posedge reset)
begin
if(reset) PS=S0;
else PS=NS;
end

always @(PS,x)
case(PS)
S0:begin 
   z<=0;
   NS<=x?S1:S0;
   end

S1:begin
   z<=0;
   NS<=x?S1:S2;
   end
   
S2:begin
   z<=0;
   NS<=x?S3:S2;
   end
   
S3:begin
   z<=x?1:0;
   NS<=x?S3:S2;
   end
   
default:begin
        z<=0;
        NS<=S0;
        end
       
  endcase
endmodule
