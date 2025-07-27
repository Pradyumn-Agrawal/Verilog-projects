`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2025 12:18:01
// Design Name: 
// Module Name: Vending_FSM
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
//Moore Model

module Vending_FSM(clk,item,x,rst,refund);
input clk,rst;
input [1:0] x;                                     //x is input money 
output reg [3:0]item;                             //items which will be dispensed;
output reg refund;                                //if money received is >20 then return will be 1

parameter FIVE=2'b00,TEN=2'b01,FIFTEEN=2'b10,TWENTY=2'b11;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100, S5=3'b101;
parameter Empty=4'b0000,Candies=4'b0001,Lays=4'b0010,Beverages=4'b0100,Chocolates=4'b1000;
reg [2:0]state;

always@(posedge clk or posedge rst)

if(rst) state<=S0;                                 //idle

else 

case(state)
S0: begin
     
     if(x==FIVE)
     state<=S1;                             //rupees 5 received
                                     
     else if(x==TEN)
     state<=S2;                          // rupees 10 received
    
     else if(x==FIFTEEN)
     state<=S3;                         //rupees 15 received 
     
     else 
     state<=S4;                       //rupees 20 received
     
     end

S1:  begin
     
     if(x==FIVE)
     state<=S2;                         // rupees 10 received
     
     else if(x==TEN)
     state<=S3;                       //rupees 15 received 
     
     else if(x==FIFTEEN)
     state<=S4;                     //rupees 20 received
     
     else 
     state<=S5;                    //extra money received ,this will be refunded
    
     end
     
S2:  begin
     
     if(x==FIVE)
     state<=S3;             //rupees 15 received 
     
     else if(x==TEN)
     state<=S4;             //rupees 20 received
         
     else
     state<=S5;         //extra money received ,this will be refunded
     
     end

S3: begin
    
    if(x==FIVE)
    state<=S4;             //rupees 20 received 
    
    else
    state<=S5;           //extra money received ,this will be refunded
    end     

S4: begin
    state<=S5;         //extra money received ,this will be refunded
    end        

S5: state<=S0;          //idle

default: state<=S0;    //idle

endcase

always@(state)
case(state)

S0:begin 
   item=Empty;refund=1'b0;
   end

S1:begin 
   item=Candies;refund=1'b0;
   end
   
S2:begin
   item=Lays;refund=1'b0;
   end
   
S3:begin 
   item=Beverages;refund=1'b0;
   end
   
S4:begin 
   item=Chocolates;refund=1'b0;
   end
   
S5:begin 
   item=Empty;refund=1'b1;
   end
   
default:begin 
        item=Empty;refund=1'b0;
        end

endcase
    
endmodule
