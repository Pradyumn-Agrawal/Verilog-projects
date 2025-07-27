`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 13:09:41
// Design Name: 
// Module Name: FSM_Traffic_Control
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


module FSM_Traffic_Control(input clk,
                           input rst, 
                           output reg[1:0]North_light,
                           output reg[1:0]East_light,
                           output reg[1:0]South_light,
                           output reg[1:0]West_light);

parameter RED=2'b00,
          YELLOW=2'b01,                      //Light Encoding
          GREEN=2'b10;                               
          
parameter S0=3'b000,            //North is GREEN ,all other lights are RED
          S1=3'b001,            // North is YELLOW
          S2=3'b010,            //East is GREEN ,all other lights are RED
          S3=3'b011,            //East is YELLOW   
          S4=3'b100,            //South is GREEN ,all other lights are RED
          S5=3'b101,            // South is YELLOW
          S6=3'b110,            //West is GREEN ,all other lights are RED
          S7=3'b111;            // West is YELLOW
          
          
          
parameter GREEN_TIME=10,                       //Duration of light 
          YELLOW_TIME=4;                    
          
reg [2:0] state,nxt_state;
reg [3:0] timer;



always@(posedge clk or posedge rst)
begin
        if(rst) begin
        state<=S0;                //North green
        timer<=0;                 //Resetting the time
        end
        
        else begin
        if(timer==((state[0]==0)?GREEN_TIME:YELLOW_TIME))
        begin
        state<=nxt_state;              //LSB of state S[0]==1  represent light is green ,S[0]==1 represent light is yellow
        timer<=0;
        end
        
        else 
        timer=timer+1;
        
        end
end

always@(*)
   case(state)
   S0: nxt_state<=S1;
   S1: nxt_state<=S2;
   S2: nxt_state<=S3;                           //State transitions
   S3: nxt_state<=S4;
   S4: nxt_state<=S5;
   S5: nxt_state<=S6;
   S6: nxt_state<=S7;
   S7: nxt_state<=S0;
   default: nxt_state<=S0;
   
   endcase
   
   
always@(*)
begin
    North_light=RED;
    East_light=RED;
    South_light=RED;
    West_light=RED;
    
    case(state)
    S0: North_light=GREEN;
    S1: North_light=YELLOW;
    S2: East_light=GREEN;
    S3: East_light=YELLOW;
    S4: South_light=GREEN;                          //output of all directions
    S5: South_light=YELLOW;
    S6: West_light=GREEN;
    S7: West_light=YELLOW;
    
    endcase
end


endmodule
    
    
   
   
   
   
 
                       
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           

