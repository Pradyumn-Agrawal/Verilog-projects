`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 14:03:02
// Design Name: 
// Module Name: tb_Vending
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


module tb_Vending();
reg clk,rst;
reg [1:0]x;
wire [3:0]item;
wire refund;

Vending_FSM VM(clk,item,x,rst,refund);

initial  clk=1'b0;
     
always  #5 clk=~clk;        //timeperiod=10


initial begin
        rst = 0;
        x = 2'b00;
        #5 x = 2'b00;  // Rs.5
        #10 x = 2'b01; // Rs.10
        #10 x = 2'b10; // Rs.15
        #10 x = 2'b11; // Rs.20
        #10 x = 2'b01; // Rs.10
        #10 x = 2'b11; // Rs.20
        #10 rst = 1;   // Reset pulse
        #10 rst = 0;
        #200 $finish;
    end
       
initial
      begin
      $dumpfile("vending_FSM.vcd");
      $dumpvars(0,tb_Vending);
      $display("Time: %d item: %4b refund:%b",$time,item,refund);
      end


endmodule
