/ fifo design - sv
// depth = 8 width = 8.. 8x8
module fifo #(
  parameter data_width  = 8,
  parameter depth = 8,
  parameter ptr_width = $clog2(depth)(
    input logic clk,
    input logic rst_n,
    input logic wr_en,
    input logic rd_en,
    input logic [data_width-1:0] din,
    output logic [data_width-1:0] dout,
    output logic full,
    output logic empty,
    output logic [ptr_width:0] fifo count);
  // memory
  logic [data_width-1:0] mem [0:depth-1];
  // pointers
  logic [ptr_width:0] wr_ptr,rd_ptr;
  //count
  assign fifo_count = wr_ptr - rd_ptr;
  assign full = (fifo_count == depth);
  assign empty = (fifo_count == 0);
  
  // write logic
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) 
      wr_ptr <= '0;
    else_if (wr_en && !full) begin
      mem[wr_ptr[ptr_width-1:0] <= din;
          wr_ptr <= wr_ptr + 1;
          end
          end
   // read logic 
          always_ff @(posedge clk or negedge rst_n) begin
            if(!rst_n)
              rd_ptr <= '0;
              dout <= '0;
            else_if (rd_en && !empty) begin
              dout <= mem[wr_ptr[ptr_width-1:0]
                          rd_ptr <= rd_ptr + 1;
                          end
                          end
                          
