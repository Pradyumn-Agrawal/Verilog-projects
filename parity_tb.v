`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2025 19:43:41
// Design Name: 
// Module Name: parity_tb
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


module parity_tb();
reg x,clk;
wire z;
Even_parity_odd CHECKER(x,clk,z);

initial
begin
$dumpfile("Even_parity_odd.vcd");
$dumpvars(0,parity_tb);
clk=1'b0;
end

always #5 clk=~clk;

initial
begin
#10 x=0; #10 x=1 ; #10 x=0;#10 x=0;
#50 $finish;
end


endmodule
