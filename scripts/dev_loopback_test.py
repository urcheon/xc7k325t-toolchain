#!/usr/bin/env python3

# FPGA Loopback Test Script
#
# Wiring Requirements (Pi -> FPGA):
# - Pi GND      -> FPGA GND
# - Pi GPIO 7   <- FPGA cm4_gpio[7] (Switch state output from FPGA)
# - Pi GPIO 8   -> FPGA cm4_gpio[8] (Loopback input to FPGA)
# - Pi GPIO 9   <- FPGA cm4_gpio[9] (Loopback output from FPGA)
#
# Note: Pin numbers below use BCM numbering.
#
# WHY THIS USES `gpiod` INSTEAD OF `RPi.GPIO`:
# RPi.GPIO is built around Raspberry Pi OS's kernel/device-tree layout and
# frequently fails or misaddresses pins on other distros (e.g. Armbian) or
# non-mainline kernels -- on this board (CM4, Armbian, kernel 6.18.35) the
# GPIO character-device interface confirmed via `gpiodetect`/`gpioinfo` is
# gpiochip0 [pinctrl-bcm2711], with line offsets 7/8/9 matching the BCM
# numbers directly. This script talks to that same chip/line combination
# via the libgpiod v2 Python bindings, matching what already works from
# the shell script and CLI tools on this system.
#
# REQUIREMENTS:
#   pip install gpiod --break-system-packages
#   (or: sudo apt install python3-libgpiod)
#
# BEFORE RUNNING:
#   Confirm with `gpiodetect` / `gpioinfo` that lines 7, 8, 9 are on
#   gpiochip0 on your board. Update GPIOCHIP below if not.

import sys
import time

try:
    import gpiod
    from gpiod.line import Direction, Value
except ImportError:
    print("Error: gpiod module not found.")
    print("Install with: pip install gpiod --break-system-packages")
    sys.exit(1)

GPIOCHIP = "/dev/gpiochip0"  # confirm via gpiodetect/gpioinfo -- update if it differs on your board

PIN_SW_IN = 7       # Reads the debounced switch from the FPGA
PIN_LOOP_OUT = 8    # Drives the signal into the FPGA loopback
PIN_LOOP_IN = 9     # Reads the signal back from the FPGA loopback

CONSUMER = "fpga-loopback-test"


def request_lines():
    return gpiod.request_lines(
        GPIOCHIP,
        consumer=CONSUMER,
        config={
            PIN_SW_IN: gpiod.LineSettings(direction=Direction.INPUT),
            PIN_LOOP_OUT: gpiod.LineSettings(
                direction=Direction.OUTPUT, output_value=Value.INACTIVE
            ),
            PIN_LOOP_IN: gpiod.LineSettings(direction=Direction.INPUT),
        },
    )


def test_switch(request):
    print("\nTest 1: Switch Input")
    print("Please press the switch (SW3) on the FPGA board.")
    print("Waiting for button press (timeout in 10 seconds)...")

    start_time = time.time()
    pressed = False

    while (time.time() - start_time) < 10:
        # The FPGA logic drives this high when the active-low button is pressed
        if request.get_value(PIN_SW_IN) == Value.ACTIVE:
            print("SUCCESS: Button press detected!")
            pressed = True
            # Wait for release so it doesn't immediately exit if held
            while request.get_value(PIN_SW_IN) == Value.ACTIVE:
                time.sleep(0.1)
            break
        time.sleep(0.1)

    if not pressed:
        print("FAILED: Timed out waiting for button press.")
        return False
    return True


def test_loopback(request):
    print("\nTest 2: GPIO Loopback")
    print("Testing Pi -> FPGA -> Pi loopback...")

    # Test setting HIGH
    request.set_value(PIN_LOOP_OUT, Value.ACTIVE)
    time.sleep(0.1)  # Give a tiny amount of time for signal propagation

    val_high = request.get_value(PIN_LOOP_IN)
    if val_high != Value.ACTIVE:
        print("FAILED: Expected HIGH signal from FPGA, but read LOW.")
        return False

    # Test setting LOW
    request.set_value(PIN_LOOP_OUT, Value.INACTIVE)
    time.sleep(0.1)

    val_low = request.get_value(PIN_LOOP_IN)
    if val_low != Value.INACTIVE:
        print("FAILED: Expected LOW signal from FPGA, but read HIGH.")
        return False

    print("SUCCESS: Loopback test passed! Signals match expected values.")
    return True


def main():
    try:
        with request_lines() as request:
            switch_ok = test_switch(request)
            loopback_ok = test_loopback(request)

            print("\nTest Summary")
            if switch_ok and loopback_ok:
                print("ALL TESTS PASSED!")
            else:
                print("SOME TESTS FAILED. Check wiring and FPGA programming.")
    except KeyboardInterrupt:
        print("\nTest interrupted by user.")


if __name__ == "__main__":
    main()
