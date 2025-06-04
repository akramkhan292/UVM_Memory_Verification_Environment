interface mem_if(input logic clk);
  
  logic reset;
  logic rd_en;
  logic wr_en;
  logic [3:0] addr;
  logic [15:0] wdata;
  logic [15:0] rdata;
  
  clocking cb_driver @(posedge clk);
    default input #1 output #1;
    output addr;
    output wr_en;
    output rd_en;
    output wdata;
    output reset;
    input rdata;
  endclocking
  
  clocking cb_monitor @(posedge clk);
    default input #1 output #1;
    input addr;
    input wr_en;
    input rd_en;
    input wdata;
    input reset;
    input rdata;
  endclocking
  
  modport DRIVER (clocking cb_driver,input clk);
  modport MONITOR (clocking cb_monitor,input clk);
  
  
endinterface