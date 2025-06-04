class mem_seq_item extends uvm_sequence_item;
  
  //data and control fields
  rand bit [3:0] addr;
  rand bit wr_en;
  rand bit rd_en;
  rand bit [15:0] wdata;
  bit [15:0] rdata;

  //utility and Field marcos
  `uvm_object_utils_begin(mem_seq_item)
  	`uvm_field_int(addr,UVM_ALL_ON)
  	`uvm_field_int(wr_en,UVM_ALL_ON)
  	`uvm_field_int(rd_en,UVM_ALL_ON)
	`uvm_field_int(wdata,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //constructor
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction
  
  //constaint, to prevent generating read and write both same vlaue
  constraint wr_rd_c { wr_en != rd_en; };
  
endclass
