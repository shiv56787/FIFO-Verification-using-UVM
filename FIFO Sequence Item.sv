// FIFO Transaction Class
// Is class me FIFO ke input-output signals define kiye hain
class fifo_seq_item extends uvm_sequence_item;

  `uvm_object_utils(fifo_seq_item)

  // Random inputs
  rand logic       wr_en;   // Write enable
  rand logic       rd_en;   // Read enable
  rand logic [7:0] din;     // Input data

  // Outputs from DUT
  logic [7:0] dout;         // Output data
  logic       full;         // FIFO full flag
  logic       empty;        // FIFO empty flag
  logic [3:0] fifo_count;   // Number of elements in FIFO

  // At least ek operation hona chahiye
  constraint valid_ops_c {
    !(wr_en === 0 && rd_en === 0);
  }

  // Write ko thoda zyada chance diya hai
  constraint wr_rd_dist_c {
    wr_en dist {1 := 60, 0 := 40};
    rd_en dist {1 := 40, 0 := 60};
  }

  // Constructor
  function new(string name = "fifo_seq_item");
    super.new(name);
  endfunction

  // Transaction copy karne ke liye
  function void do_copy(uvm_object rhs);
    fifo_seq_item rhs_;

    super.do_copy(rhs);

    if(!$cast(rhs_, rhs))
      `uvm_fatal("TYPE_MISMATCH", "Wrong object type")

    wr_en      = rhs_.wr_en;
    rd_en      = rhs_.rd_en;
    din        = rhs_.din;
    dout       = rhs_.dout;
    full       = rhs_.full;
    empty      = rhs_.empty;
    fifo_count = rhs_.fifo_count;
  endfunction

  // Transaction ko readable format me print karne ke liye
  function string convert2string();
    return $sformatf(
      "wr_en=%0b rd_en=%0b din=0x%0h dout=0x%0h full=%0b empty=%0b count=%0d",
      wr_en, rd_en, din, dout, full, empty, fifo_count
    );
  endfunction

endclass
