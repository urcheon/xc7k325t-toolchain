#!/bin/bash

# FPGA Loopback Test Script using sysfs
#
# Wiring Requirements (Pi -> FPGA):
# - Pi GND      -> FPGA GND
# - Pi GPIO 17  <- FPGA gpio_u4[7] (Switch state output from FPGA)
# - Pi GPIO 27  -> FPGA gpio_u4[8] (Loopback input to FPGA)
# - Pi GPIO 22  <- FPGA gpio_u4[9] (Loopback output from FPGA)
#
# Run this script with root privileges (sudo) if you encounter permission issues.

# BCM Pin Numbers
PIN_SW_IN=17
PIN_LOOP_OUT=27
PIN_LOOP_IN=22

SYSFS_DIR="/sys/class/gpio"

# Helper function to export a GPIO pin
export_pin() {
    local pin=$1
    if [ ! -d "$SYSFS_DIR/gpio$pin" ]; then
        echo "$pin" > "$SYSFS_DIR/export"
        # Small delay to allow udev to set permissions
        sleep 0.2
    fi
}

# Helper function to unexport a GPIO pin
unexport_pin() {
    local pin=$1
    if [ -d "$SYSFS_DIR/gpio$pin" ]; then
        echo "$pin" > "$SYSFS_DIR/unexport"
    fi
}

cleanup() {
    echo "Cleaning up..."
    unexport_pin $PIN_SW_IN
    unexport_pin $PIN_LOOP_OUT
    unexport_pin $PIN_LOOP_IN
    exit
}

# Trap Ctrl+C and ensure cleanup runs
trap cleanup SIGINT SIGTERM

echo "Setting up GPIO pins..."
export_pin $PIN_SW_IN
export_pin $PIN_LOOP_OUT
export_pin $PIN_LOOP_IN

# Set pin directions
echo "in" > "$SYSFS_DIR/gpio$PIN_SW_IN/direction"
echo "out" > "$SYSFS_DIR/gpio$PIN_LOOP_OUT/direction"
echo "in" > "$SYSFS_DIR/gpio$PIN_LOOP_IN/direction"

# Initialize output to low
echo "0" > "$SYSFS_DIR/gpio$PIN_LOOP_OUT/value"

# Test 1: Switch Input
echo ""
echo "Test 1: Switch Input"
echo "Please press the switch (SW3) on the FPGA board."
echo "Waiting for button press (timeout in 10 seconds)..."

TIMEOUT=100 # 10 seconds (100 * 0.1s)
PRESSED=0

for (( i=0; i<$TIMEOUT; i++ )); do
    val=$(cat "$SYSFS_DIR/gpio$PIN_SW_IN/value")
    if [ "$val" -eq "1" ]; then
        echo "SUCCESS: Button press detected!"
        PRESSED=1

        # Wait for release
        while [ "$(cat "$SYSFS_DIR/gpio$PIN_SW_IN/value")" -eq "1" ]; do
            sleep 0.1
        done
        break
    fi
    sleep 0.1
done

if [ "$PRESSED" -eq "0" ]; then
    echo "FAILED: Timed out waiting for button press."
    SWITCH_OK=0
else
    SWITCH_OK=1
fi

# Test 2: GPIO Loopback
echo ""
echo "Test 2: GPIO Loopback"
echo "Testing Pi -> FPGA -> Pi loopback..."

LOOPBACK_OK=1

# Test setting HIGH
echo "1" > "$SYSFS_DIR/gpio$PIN_LOOP_OUT/value"
sleep 0.1
val_high=$(cat "$SYSFS_DIR/gpio$PIN_LOOP_IN/value")

if [ "$val_high" -ne "1" ]; then
    echo "FAILED: Expected HIGH (1) signal from FPGA, but read $val_high."
    LOOPBACK_OK=0
fi

# Test setting LOW
echo "0" > "$SYSFS_DIR/gpio$PIN_LOOP_OUT/value"
sleep 0.1
val_low=$(cat "$SYSFS_DIR/gpio$PIN_LOOP_IN/value")

if [ "$val_low" -ne "0" ]; then
    echo "FAILED: Expected LOW (0) signal from FPGA, but read $val_low."
    LOOPBACK_OK=0
fi

if [ "$LOOPBACK_OK" -eq "1" ]; then
    echo "SUCCESS: Loopback test passed! Signals match expected values."
fi

# Summary
echo ""
echo "Test Summary"
if [ "$SWITCH_OK" -eq "1" ] && [ "$LOOPBACK_OK" -eq "1" ]; then
    echo "ALL TESTS PASSED!"
else
    echo "SOME TESTS FAILED. Check wiring and FPGA programming."
fi

cleanup
