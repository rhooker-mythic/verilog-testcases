module counter #(
  parameter WIDTH = 8
)(
  // system signals
  input  wire             clk,
  input  wire             rst,
  // counter signas
  input  wire             cen,  // counter enable
  input  wire             wen,  // write enable
  input  wire [WIDTH-1:0] dat,  // input data
  output reg  [WIDTH-1:0] o_p,  // output value (posedge counter)
  output reg  [WIDTH-1:0] o_n   // output value (negedge counter)
);


always @ (posedge clk, posedge rst)
if (rst) o_p <= {WIDTH{1'b0}};
else     o_p <= wen ? dat : o_p + {{WIDTH-1{1'b0}}, cen};


always @ (negedge clk, posedge rst)
if (rst) o_n <= {WIDTH{1'b0}};
else     o_n <= wen ? dat : o_n + {{WIDTH-1{1'b0}}, cen};

reg [31:0] clks;

initial begin
   clks = 0;
end

always @(posedge clk) begin
   clks <= clks + 1;
end

always @(posedge clk) begin
   $display("@%d ----- xxx -----", clks);
end

logic [1:0] sel;
logic [3:0] data;

assign sel = clks[1:0];

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

always @(negedge clk) begin
   $display("    sel %2d --> data %4d", sel, data);
end

endmodule
