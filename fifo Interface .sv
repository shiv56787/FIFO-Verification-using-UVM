//  FIFO Interface
interface fifo_if #(
  parameter DATA_WIDTH = 8
)(input logic clk, input logic rst_n);

  logic      wr_en;
  logic      rd_en;
  logic [DATA_WIDTH-1:0] din;
  logic [DATA_WIDTH-1:0] dout;
  logic   full;
  logic    empty;
  logic [3:0]            fifo_count;

  // for driver
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
    output wr_en;
    output rd_en;
    output din;
    input  dout;
    input  full;
    input  empty;
    input  fifo_count;
  endclocking

  //  for monitor
  clocking monitor_cb @(posedge clk);
    default input #1;
    input wr_en;
    input rd_en;
    input din;
    input dout;
    input full;
    input empty;
    input fifo_count;
  endclocking

  // Modport 
  modport DRIVER  (clocking driver_cb,  input clk, input rst_n);
  modport MONITOR (clocking monitor_cb, input clk, input rst_n);

endinterface
