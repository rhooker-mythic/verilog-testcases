// Code your design here
module foo ( input [1:0] sel,
             output [3:0] data,
             input clk,
             input reset 
           );
  
assign data = sel == 0 ? 4'd0 :
            sel == 1 ? 4'd1 :
            sel == 2 ? 4'd2 :
            sel == 3 ? 4'd3 :
            sel == 4 ? 4'd4 :
            sel == 5 ? 4'd5 :
            sel == 6 ? 4'd6 :
            sel == 7 ? 4'd7 :
            sel == 8 ? 4'd8 :
            sel == 9 ? 4'd9 :
                   4'd0 ;
  
endmodule
