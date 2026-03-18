// This module implements the core test logic for the FPGA board. It contains:
// * A 1Hz blinking LED to verify the clock and sequential logic.
// * A debounced switch input that drives a GPIO pin high when pressed.
// * A GPIO loopback test where one GPIO input controls a GPIO output and a second LED.
module loopback (
    input  wire clk,
    input  wire switch_in,
    input  wire gpio_loop_in,

    output wire led_blink,
    output wire led_gpio,
    output wire gpio_from_switch,
    output wire gpio_loop_out
);

    // System clock frequency, used for timing calculations.
    localparam CLK_FREQ = 50_000_000;

    // 1Hz Blinking LED Logic
    // Counter toggles the LED every half second.
    localparam BLINK_COUNTER_MAX = CLK_FREQ / 2;
    reg [$clog2(BLINK_COUNTER_MAX)-1:0] blink_counter = 0;
    reg led_blink_reg = 1'b0;

    assign led_blink = led_blink_reg;

    always @(posedge clk) begin
        if (blink_counter == BLINK_COUNTER_MAX - 1) begin
            blink_counter <= 0;
            led_blink_reg <= ~led_blink_reg;
        end else begin
            blink_counter <= blink_counter + 1;
        end
    end

    // Switch to GPIO Logic
    wire debounced_switch;

    // Instantiate debouncer for a clean switch signal.
    debouncer #(
        .CLK_FREQ(CLK_FREQ)
    ) u_debouncer (
        .clk(clk),
        .button_in(switch_in),
        .button_out(debounced_switch)
    );

    // Drive a GPIO high when the switch is pressed.
    // Assumes an active-low switch (value is 0 when pressed).
    assign gpio_from_switch = (debounced_switch == 1'b0);

    // GPIO Loopback Logic
    // The output GPIO and a second LED directly mirror the state of the input GPIO.
    assign gpio_loop_out = gpio_loop_in;
    assign led_gpio = gpio_loop_in;

endmodule
