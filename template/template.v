`timescale 1ns / 1ps
`default_nettype none
module test;
  parameter clock_half_period = 10;
  
  /* input */   
  reg CLK;
  reg RST_X;
  
  /* output */   
  wire ULED;

  initial begin
    CLK = 0;
    forever #(clock_half_period) CLK = ~CLK;
  end
  
  initial begin
    RST_X = 1;
    #1000;
    RST_X = 0;
    #1000;
    RST_X = 1;
  end
  
  L_TIKA uut(CLK, RST_X, ULED);
  
  initial begin
    $dumpfile("uut.vcd");
    $dumpvars(0, uut);
  end
  
  initial begin
    #10000;
    $finish;
  end
endmodule

module L_TIKA #(parameter   WIDTH = 32)
               (input  wire CLK, 
                input  wire RST_X, 
                output wire ULED);
  
  reg [WIDTH-1:0] cnt;
  
  assign ULED = cnt[2];

  always @(posedge CLK) begin
    if (!RST_X) cnt <= 0;
    else        cnt <= cnt + 1;
  end

endmodule
`default_nettype wire
