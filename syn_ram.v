module sync_ram (
    input clk,
    input we,                     // Write Enable
    input [3:0] addr,             // 16 locations
    input [7:0] data_in,          // 8-bit data
    output reg [7:0] data_out
);

reg [7:0] memory [15:0];          // 16x8 RAM

always @(posedge clk)
begin
    if (we)
        memory[addr] <= data_in;  // Write operation
    else
        data_out <= memory[addr]; // Read operation
end

endmodule