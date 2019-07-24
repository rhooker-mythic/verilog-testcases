// Code your testbench here
// or browse Examples
module tb;
  
  reg clk;
  reg reset;
  reg [31:0] clks;
  
  initial begin
    clk = 0;
    reset = 1;
    clks = 0;
  end
  
  always #(100) 
   clk = ~clk;
  
  always @(posedge clk)
    clks = clks + 1;
  
  always @(posedge clk) begin
    $display("@%d ----- clks %8d -----", $time, clks);
    if (clks >= 32) $finish;
    if (clks > 10) reset = 0;
  end
  
  wire [1:0] sel;
  wire [3:0] data;
  
  assign sel[1:0] = clks[1:0];
  
  foo foo ( .sel   ( sel   ),
            .data  ( data  ), 
         .clk   ( clk   ),
            .reset ( reset )
          );
  
  always @(negedge clk) begin
    $display("@%d sel = %d --> data = %d", $time, sel, data);
  end
  
endmodule
