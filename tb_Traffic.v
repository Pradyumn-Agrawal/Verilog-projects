`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 13:50:24
// Design Name: 
// Module Name: tb_Traffic
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


module tb_Traffic();
reg clk;
reg rst;
wire [1:0]NL;
wire [1:0]EL;
wire [1:0]SL;
wire [1:0]WL;

FSM_Traffic_Control GYR(.clk(clk),
                        .rst(rst),
                        .North_light(NL),
                        .East_light(EL),
                        .South_light(SL),
                        .West_light(WL));
                        
                        
initial clk=0;
always #5 clk=~clk;

initial
begin
     $dumpfile("FSM_Traffic_Control.vcd");
     $dumpvars(0,tb_Traffic);
     rst=1;
     #10 rst=0;
     
     #300 $finish;
     
     
     
end

always@(posedge clk)
 $display("Time=%d | NL=%b EL=%b SL=%b WL=%b",$time,NL,EL,SL,WL);
     
     
                 
endmodule
