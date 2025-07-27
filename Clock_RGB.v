`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2025 14:05:34
// Design Name: 
// Module Name: Clock_RGB
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


module Clock_RGB(Clock,Light);
input Clock;
output reg [2:0] Light;
parameter S0=0,S1=1,S2=2;
parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
reg [1:0]State;

always@(posedge Clock)
begin
case(State)
   S0:begin 
        State<=S1;
      end
   S1:begin
      State<=S2;
      end
   S2:begin
      State<=S0;
      end
   default:begin
      State<=S0;
      end
   endcase
   end
   
   always@(State)
   begin
   case(State)
   S0:Light=RED;
   S1:Light=GREEN;
   S2:Light=YELLOW;
   default:Light=RED;
   endcase
   end
  
   
endmodule
