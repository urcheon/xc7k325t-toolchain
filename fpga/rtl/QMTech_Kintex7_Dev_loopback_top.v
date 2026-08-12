// Top-level module for the QMTech Kintex7 Development board test design.
// Connects external pins defined in the XDC file to internal logic.
module fpga_top (
    input  wire SYS_CLK,

    // SW[2] is sys_rst_n
    // SW[3] is user_button
    input  wire [3:2] SW,

    output wire [3:2] LED,

    // CM4_GPIO[7] output from switch
    // CM4_GPIO[8] input for loopback
    // CM4_GPIO[9] output for loopback
    inout  wire [9:7] CM4_GPIO
);

    wire w_led_blink;
    wire w_led_gpio;
    wire w_gpio_from_switch;
    wire w_gpio_loop_in;
    wire w_gpio_loop_out;

`ifdef HLS_BUILD
    // Bambu generates active-high reset and requires a start signal to begin execution.
    // With --generate-interface=INFER, outputs match the C++ variable names.
    loopback u_loopback (
        .clock(SYS_CLK),
        .reset(SW[2]),
        .start_port(1'b1),
        .switch_in(SW[3]),
        .gpio_loop_in(w_gpio_loop_in),
        
        // Data output ports
        .led_blink(w_led_blink),
        .led_gpio(w_led_gpio),
        .gpio_from_switch(w_gpio_from_switch),
        .gpio_loop_out(w_gpio_loop_out)
        
        // Note: Bambu also generated .led_blink_vld(), .done_port(), etc.
        // We can safely leave those unconnected for simple GPIO driving.
    );
`else
    loopback u_loopback (
        .clk(SYS_CLK),
        .switch_in(SW[3]),
        .gpio_loop_in(w_gpio_loop_in),
        .led_blink(w_led_blink),
        .led_gpio(w_led_gpio),
        .gpio_from_switch(w_gpio_from_switch),
        .gpio_loop_out(w_gpio_loop_out)
    );
`endif

    // Assign LEDs
    assign LED[2] = w_led_blink;
    assign LED[3] = w_led_gpio;

    // Assign GPIO pins
    // Connects to an external test driver for loopback testing
    assign CM4_GPIO[7] = w_gpio_from_switch;
    assign w_gpio_loop_in = CM4_GPIO[8];
    assign CM4_GPIO[9] = w_gpio_loop_out;

endmodule