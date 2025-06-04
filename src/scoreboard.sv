class mem_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(mem_scoreboard)
  
  mem_seq_item pkt_qu[$];
  
  bit [15:0] mem [15:0];
  
  uvm_analysis_imp#(mem_seq_item, mem_scoreboard) item_collected_export;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    item_collected_export = new("item_collected_export", this);
    foreach(mem[i]) mem[i] = 0;
  endfunction
  
  virtual function void write(mem_seq_item pkt);
    pkt_qu.push_back(pkt);
  endfunction
  
  task run_phase(uvm_phase phase);
    mem_seq_item mem_pkt;
    forever begin
      wait(pkt_qu.size()>0);
      mem_pkt = pkt_qu.pop_front();
      if(mem_pkt.wr_en) begin
        mem[mem_pkt.addr] = mem_pkt.wdata;
        `uvm_info(get_type_name(),$sformatf("------- WRITE DATA -------"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("ADDR = %h ", mem_pkt.addr),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("DATA = %h ", mem_pkt.wdata),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("--------------------------"),UVM_LOW)
      end
      else if(mem_pkt.rd_en) begin
        if(mem[mem_pkt.addr] == mem_pkt.rdata) begin
          `uvm_info(get_type_name(),$sformatf("------- READ DATA -------"),UVM_LOW)
	      `uvm_info(get_type_name(),$sformatf("ADDR = %h ", mem_pkt.addr),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("DATA = %h ", mem_pkt.rdata),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("--------------------------"),UVM_LOW)
        end
        else begin
          `uvm_error(get_type_name(),"------- DATA misMATCH ------")
          `uvm_info(get_type_name(),$sformatf("ADDR = %h ",mem_pkt.addr),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("ACTUAL DATA = %h , EXPECTED DATA = %h",mem[mem_pkt.addr],mem_pkt.rdata),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("--------------------------"),UVM_LOW)
        end
      end
    end
  endtask
  
endclass
