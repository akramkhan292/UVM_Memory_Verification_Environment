// Code your design here
module memory #(parameter ADDR_WIDTH = 4, parameter DATA_WIDTH = 16) 
  (
    input clk,
    input reset,
    input [ADDR_WIDTH-1:0] addr,
    input rd_en,
    input wr_en,
    input [DATA_WIDTH-1:0] wdata,
    output logic [DATA_WIDTH-1:0] rdata
  );
  
  reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH];
  
  always @(posedge clk or reset) begin
    if(reset) begin
      foreach(mem[i])
        mem[i] <= 0;
    end
    else begin
      if(rd_en)
        rdata <= mem[addr];
      if(wr_en)
        mem[addr] <= wdata;
    end
  end
endmodule