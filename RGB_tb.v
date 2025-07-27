`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2025 14:18:31
// Design Name: 
// Module Name: RGB_tb
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


module RGB_tb();
reg Clock;
wire [2:0]Light;
Clock_RGB LAMP(Clock,Light);

always #5 Clock=~Clock;

initial
begin
  Clock=1'b0;
  #100 $finish;
end

initial
begin
$dumpfile("Clock_RGB.vcd");
$dumpvars(0,RGB_tb);
$monitor($time,"RGB=%b",Light);
end

endmodule
