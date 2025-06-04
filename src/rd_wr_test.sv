class mem_rd_wr_test extends mem_base_test;
  
  `uvm_component_utils(mem_rd_wr_test)
  
  mem_rd_wr_seq seq;
  
  function new(string name="mem_rd_wr_seq",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq = mem_rd_wr_seq::type_id::create("seq");
  endfunction
  
  task run_phase(uvm_phase phase);
    
    
    phase.raise_objection(this);
      seq.start(env.agent.sequencer);
    phase.drop_objection(this);
    
    phase.phase_done.set_drain_time(this,50);    
  endtask
  
endclass