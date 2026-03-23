`timescale 1ns/1ps

module sync_ram_tb;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] data_in;
wire [7:0] data_out;

sync_ram uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;

    // Write data
    we = 1; addr = 4'b0001; data_in = 8'hAA; #10;
    we = 1; addr = 4'b0010; data_in = 8'h55; #10;

    // Read data
    we = 0; addr = 4'b0001; #10;
    we = 0; addr = 4'b0010; #10;

    $stop;
end

endmodule