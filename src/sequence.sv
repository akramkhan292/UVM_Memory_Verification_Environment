class mem_sequence extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(mem_sequence)
  
  //constructor
  
  function new(string name ="mem_sequence");
    super.new(name);
  endfunction
  
  `uvm_declare_p_sequencer(mem_sequencer)
  
  virtual task body();
    repeat(2) begin
      req = mem_seq_item::type_id::create("req");
      wait_for_grant();
      req.randomize();
      send_request(req);
      wait_for_item_done();
    end
    
  endtask
  
endclass

class mem_wr_seq extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(mem_wr_seq)
  
  //constructor
  function new(string name = "men_wr_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,{req.wr_en==1;req.rd_en==0;})
  endtask
  
endclass

class mem_rd_seq extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(mem_rd_seq)
  
  //constructor
  function new(string name = "men_rd_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    `uvm_do_with(req,{req.rd_en==1;req.wr_en==0;})
  endtask
  
endclass

class mem_rd_wr_seq extends uvm_sequence#(mem_seq_item);
  `uvm_object_utils(mem_rd_wr_seq)
  mem_wr_seq wr_seq;
  mem_rd_seq rd_seq;
  
  function new(string name="mem_rd_wr_seq");
    super.new(name);
  endfunction
  virtual task body();
    `uvm_do(wr_seq)
    `uvm_do(rd_seq)
  endtask
  
endclass