`timescale 1ns / 1ps
`default_nettype none
module test;
  parameter clock_half_period = 5;
  
  /* input */   
  reg CLK;
  reg RST;
  
  /* output */   
  wire ULED;

  // Clock and Reset Generator
  initial begin CLK = 0; forever #(clock_half_period) CLK = ~CLK; end
  initial begin RST = 1; #1000; RST = 0; end
  
  L_TIKA uut(CLK, RST, ULED);
  
  // get waveform data
  initial begin
    $dumpfile("uut.vcd");
    $dumpvars(0, uut);
  end

  // simulation finish flag
  always @(posedge CLK) if (uut.cnt == 30) $finish();
  
endmodule

module L_TIKA #(parameter   WIDTH = 32)
               (input  wire CLK, 
                input  wire RST, 
                output wire ULED);
  
  reg [WIDTH-1:0] cnt;
  
  assign ULED = cnt[2];
  
  always @(posedge CLK) begin
    if (RST) cnt <= 0;
    else     cnt <= cnt + 1;
  end

endmodule
`default_nettype wire
