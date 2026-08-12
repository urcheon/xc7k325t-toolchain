#!/usr/bin/env python3

# FPGA Loopback Test Script
#
# Wiring Requirements (Pi -> FPGA):
# - Pi GND      -> FPGA GND
# - Pi GPIO 17  <- FPGA gpio_u4[7] (Switch state output from FPGA)
# - Pi GPIO 27  -> FPGA gpio_u4[8] (Loopback input to FPGA)
# - Pi GPIO 22  <- FPGA gpio_u4[9] (Loopback output from FPGA)
#
# Note: Pin numbers below use BCM numbering.

import time
import sys

try:
    # RPi.GPIO works for Raspberry Pi.
    # For Orange Pi, you may need OPi.GPIO imported as GPIO.
    import RPi.GPIO as GPIO
except ImportError:
    print("Error: RPi.GPIO module not found.")
    print("Please install it or use the appropriate library for your board.")
    sys.exit(1)

# Pin definitions (BCM)
PIN_SW_IN = 17      # Reads the debounced switch from the FPGA
PIN_LOOP_OUT = 27   # Drives the signal into the FPGA loopback
PIN_LOOP_IN = 22    # Reads the signal back from the FPGA loopback

def setup():
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)

    # Configure pins
    GPIO.setup(PIN_SW_IN, GPIO.IN)
    GPIO.setup(PIN_LOOP_OUT, GPIO.OUT)
    GPIO.setup(PIN_LOOP_IN, GPIO.IN)

    # Initialize output to low
    GPIO.output(PIN_LOOP_OUT, GPIO.LOW)

def test_switch():
    print("\nTest 1: Switch Input")
    print("Please press the switch (SW3) on the FPGA board.")
    print("Waiting for button press (timeout in 10 seconds)...")

    start_time = time.time()
    pressed = False

    while (time.time() - start_time) < 10:
        # The FPGA logic drives this high when the active-low button is pressed
        if GPIO.input(PIN_SW_IN) == GPIO.HIGH:
            print("SUCCESS: Button press detected!")
            pressed = True
            # Wait for release so it doesn't immediately exit if held
            while GPIO.input(PIN_SW_IN) == GPIO.HIGH:
                time.sleep(0.1)
            break
        time.sleep(0.1)

    if not pressed:
        print("FAILED: Timed out waiting for button press.")
        return False
    return True

def test_loopback():
    print("\nTest 2: GPIO Loopback")
    print("Testing Pi -> FPGA -> Pi loopback...")

    # Test setting HIGH
    GPIO.output(PIN_LOOP_OUT, GPIO.HIGH)
    time.sleep(0.1) # Give a tiny amount of time for signal propagation

    val_high = GPIO.input(PIN_LOOP_IN)
    if val_high != GPIO.HIGH:
        print("FAILED: Expected HIGH signal from FPGA, but read LOW.")
        return False

    # Test setting LOW
    GPIO.output(PIN_LOOP_OUT, GPIO.LOW)
    time.sleep(0.1)

    val_low = GPIO.input(PIN_LOOP_IN)
    if val_low != GPIO.LOW:
        print("FAILED: Expected LOW signal from FPGA, but read HIGH.")
        return False

    print("SUCCESS: Loopback test passed! Signals match expected values.")
    return True

def main():
    try:
        setup()
        switch_ok = test_switch()
        loopback_ok = test_loopback()

        print("\nTest Summary")
        if switch_ok and loopback_ok:
            print("ALL TESTS PASSED!")
        else:
            print("SOME TESTS FAILED. Check wiring and FPGA programming.")

    except KeyboardInterrupt:
        print("\nTest interrupted by user.")
    finally:
        GPIO.cleanup()

if __name__ == '__main__':
    main()
