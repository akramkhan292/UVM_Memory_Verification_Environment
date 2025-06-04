`define MON_IF vif.cb_monitor
class mem_monitor extends uvm_monitor;
  
  virtual mem_if vif;
  uvm_analysis_port #(mem_seq_item) item_collected_port;
  mem_seq_item trans_collected;
  
  `uvm_component_utils(mem_monitor)
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    trans_collected = new();
    item_collected_port = new("item_collected_port", this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual mem_if)::get(this,"","vif",vif))
      `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever
      begin
        //$display("intf.wr_en=%d intf.rd_en=%d",`MON_IF.wr_en,`MON_IF.wr_en);
        @(posedge vif.MONITOR.clk)
        //$display("intf.wr_en=%d intf.rd_en=%d",`MON_IF.wr_en,`MON_IF.wr_en);
        wait(`MON_IF.wr_en || `MON_IF.rd_en)
        trans_collected.addr = `MON_IF.addr;
        if(vif.cb_monitor.wr_en) begin
          trans_collected.wr_en = `MON_IF.wr_en;
          trans_collected.wdata = `MON_IF.wdata;
          trans_collected.rd_en = 0;
          @(posedge vif.MONITOR.clk);
        end
        if(`MON_IF.rd_en) begin
          trans_collected.rd_en = `MON_IF.rd_en;
          trans_collected.wr_en = 0;
          @(posedge vif.MONITOR.clk)
          @(posedge vif.MONITOR.clk)
          trans_collected.rdata = `MON_IF.rdata;
        end
        item_collected_port.write(trans_collected);
      end
  endtask
        
  
  
endclass