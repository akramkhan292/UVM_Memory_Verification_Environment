// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "mem_base_test.sv"
`include "rd_wr_test.sv"

module memory_tb;
  
  logic clk;
  logic reset;
  
  initial clk = 0;
  
  always #5 clk = ~clk;
  
  always begin
    reset=1;
    #5 reset =0;
  end
  
  mem_if intf(clk);
  
  memory DUT(.clk(intf.clk),
             .reset(intf.reset),
             .addr(intf.addr),
             .rd_en(intf.rd_en),
             .wr_en(intf.wr_en),
             .wdata(intf.wdata),
             .rdata(intf.rdata)
            );
  
  initial begin
    uvm_config_db#(virtual mem_if)::set(uvm_root::get(),"*","vif",intf);
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  initial begin
    run_test("mem_rd_wr_test");
  end
  
endmodule