// This is a C++ implementation of the loopback and debouncer logic,
// intended for High-Level Synthesis (HLS) with a tool like Bambu.
// The top-level function 'loopback' is synthesized into a hardware module.
// 'static' variables are used to infer registers that hold state
// between clock cycles (i.e., between function calls).

// Define system constants. These should match the target hardware.
#define CLK_FREQ 50000000
#define DEBOUNCE_TIME_MS 10

// VERY Brittle
#define CYCLES_PER_INVOCATION 7
#define ACTUAL_TICK_RATE (CLK_FREQ / CYCLES_PER_INVOCATION)

// Calculate counter limits based on the system constants.
#define BLINK_COUNTER_MAX (ACTUAL_TICK_RATE / 2)
#define DEBOUNCE_COUNTER_MAX ((CLK_FREQ / 1000) * DEBOUNCE_TIME_MS)

// The main function to be synthesized.
// Inputs are passed by value.
// Outputs are passed by reference to infer scalar output ports instead of memory interfaces.
extern "C" void loopback(
    bool switch_in,
    bool gpio_loop_in,
    bool& led_blink,
    bool& led_gpio,
    bool& gpio_from_switch,
    bool& gpio_loop_out)
{
    // 1Hz Blinking LED Logic
    // Static variables to maintain state across clock cycles (function calls).
    static int blink_counter = 0;
    static bool led_blink_reg = false;

    if (blink_counter == BLINK_COUNTER_MAX - 1) {
        blink_counter = 0;
        led_blink_reg = !led_blink_reg;
    } else {
        blink_counter++;
    }
    led_blink = led_blink_reg;


    // Switch Debouncer Logic
    // Static variables for the debouncer state.
    static int debounce_counter = 0;
    static bool button_sync_1 = true;
    static bool button_sync_2 = true;
    static bool debounced_switch_out = true; // Stable output, initialized to inactive.

    // Synchronize the input to prevent metastability.
    button_sync_2 = button_sync_1;
    button_sync_1 = switch_in;

    if (button_sync_2 != debounced_switch_out) {
        // If the input signal is different from the stable output, start counting.
        if (debounce_counter < DEBOUNCE_COUNTER_MAX - 1) {
            debounce_counter++;
        } else {
            // The signal has been stable for the required duration.
            // Update the output and reset the counter.
            debounced_switch_out = button_sync_2;
            debounce_counter = 0;
        }
    } else {
        // The input signal is the same as the output, so it's stable.
        // Reset the counter.
        debounce_counter = 0;
    }


    // Switch to GPIO Logic
    // Drive a GPIO high when the switch is pressed.
    // Assumes an active-low switch (value is false when pressed).
    gpio_from_switch = (debounced_switch_out == false);


    // GPIO Loopback Logic (Combinational)
    // The output GPIO and a second LED directly mirror the state of the input GPIO.
    gpio_loop_out = gpio_loop_in;
    led_gpio = gpio_loop_in;
}
