// A generic switch debouncer module.
// It uses a counter to wait for a stable signal before changing the output.
module debouncer #(
    parameter CLK_FREQ      = 50_000_000, // System clock frequency in Hz
    parameter DEBOUNCE_TIME = 10          // Debounce time in milliseconds
) (
    input  wire clk,
    input  wire button_in,
    output reg  button_out
);

    localparam COUNTER_MAX = (CLK_FREQ / 1000) * DEBOUNCE_TIME;

    reg [$clog2(COUNTER_MAX)-1:0] counter = 0;
    reg button_sync_1;
    reg button_sync_2;

    initial begin
        // Initialize to inactive state, assuming active-low button.
        button_out = 1'b1;
    end

    always @(posedge clk) begin
        // Synchronize the input to prevent metastability issues.
        button_sync_1 <= button_in;
        button_sync_2 <= button_sync_1;

        if (button_sync_2 != button_out) begin
            // If the input differs from the stable output, start or continue counting.
            if (counter < COUNTER_MAX - 1) begin
                counter <= counter + 1;
            end else begin
                // If the counter reaches its max, the signal is considered stable.
                // Update the output and reset the counter.
                button_out <= button_sync_2;
                counter <= 0;
            end
        end else begin
            // If the input is the same as the output, the signal is stable.
            // Reset the counter.
            counter <= 0;
        end
    end

endmodule
