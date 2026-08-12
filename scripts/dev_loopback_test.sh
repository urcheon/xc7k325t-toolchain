#!/bin/sh
#
# FPGA Loopback Test Script using libgpiod v2 CLI tools
# (gpiodetect / gpioinfo / gpioget / gpioset)
#
# Wiring Requirements (Pi -> FPGA):
# - Pi GND      -> FPGA GND
# - Pi GPIO 7   <- FPGA cm4_gpio[7] (Switch state output from FPGA)
# - Pi GPIO 8   -> FPGA cm4_gpio[8] (Loopback input to FPGA)
# - Pi GPIO 9   <- FPGA cm4_gpio[9] (Loopback output from FPGA)
#
# Written as portable POSIX sh (works under both `sh` and `bash`) so it
# doesn't break depending on how it's invoked.
#
# Confirmed on this board via `gpiodetect` / `gpioinfo`:
#   gpiochip0 [pinctrl-bcm2711] owns lines 7, 8, 9 directly (offset == BCM number)
#
# REQUIREMENTS: libgpiod v2.x tools (already installed: gpiod 2.2.1)
#
# NOTE ON gpioset v2:
# Unlike libgpiod v1, `gpioset` in v2 has no "set and exit" mode -- it holds
# the requested line value until the process is terminated (SIGINT/SIGTERM),
# then releases the line back to input/floating. So to drive PIN_LOOP_OUT
# we start `gpioset` in the background, keep its PID, and kill it whenever
# we need to change the value or clean up. This also avoids the line
# floating between test steps.

GPIOCHIP="gpiochip0"   # confirmed via gpiodetect/gpioinfo -- update if it differs on your board

PIN_SW_IN=7
PIN_LOOP_OUT=8
PIN_LOOP_IN=9

CONSUMER="fpga-loopback-test"

GPIOSET_PID=""

command -v gpioget >/dev/null 2>&1 || { echo "libgpiod tools not found. Run: sudo apt install -y gpiod"; exit 1; }

stop_gpioset() {
    if [ -n "$GPIOSET_PID" ] && kill -0 "$GPIOSET_PID" 2>/dev/null; then
        kill "$GPIOSET_PID" 2>/dev/null
        wait "$GPIOSET_PID" 2>/dev/null
    fi
    GPIOSET_PID=""
}

set_loop_out() {
    val=$1
    stop_gpioset
    gpioset -c "$GPIOCHIP" -C "$CONSUMER" "$PIN_LOOP_OUT=$val" >/dev/null 2>&1 &
    GPIOSET_PID=$!
    sleep 0.1   # let it claim the line and drive it before we read anything
}

read_pin() {
    gpioget --numeric -c "$GPIOCHIP" -C "$CONSUMER" "$1"
}

cleanup() {
    echo "Cleaning up..."
    stop_gpioset
    exit
}

trap cleanup INT TERM

echo "Using $GPIOCHIP (confirm this is correct with 'gpioinfo' if tests fail unexpectedly)"

# Initialize output to low
set_loop_out 0

# Test 1: Switch Input
echo ""
echo "Test 1: Switch Input"
echo "Please press the switch (SW3) on the FPGA board."
echo "Waiting for button press (timeout in 10 seconds)..."

TIMEOUT=100 # 10 seconds (100 * 0.1s)
PRESSED=0

i=0
while [ "$i" -lt "$TIMEOUT" ]; do
    val=$(read_pin "$PIN_SW_IN")
    if [ "$val" -eq 1 ]; then
        echo "SUCCESS: Button press detected!"
        PRESSED=1

        # Wait for release
        while [ "$(read_pin "$PIN_SW_IN")" -eq 1 ]; do
            sleep 0.1
        done
        break
    fi
    sleep 0.1
    i=$((i + 1))
done

if [ "$PRESSED" -eq 0 ]; then
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
set_loop_out 1
val_high=$(read_pin "$PIN_LOOP_IN")

if [ "$val_high" -ne 1 ]; then
    echo "FAILED: Expected HIGH (1) signal from FPGA, but read $val_high."
    LOOPBACK_OK=0
fi

# Test setting LOW
set_loop_out 0
val_low=$(read_pin "$PIN_LOOP_IN")

if [ "$val_low" -ne 0 ]; then
    echo "FAILED: Expected LOW (0) signal from FPGA, but read $val_low."
    LOOPBACK_OK=0
fi

if [ "$LOOPBACK_OK" -eq 1 ]; then
    echo "SUCCESS: Loopback test passed! Signals match expected values."
fi

# Summary
echo ""
echo "Test Summary"
if [ "$SWITCH_OK" -eq 1 ] && [ "$LOOPBACK_OK" -eq 1 ]; then
    echo "ALL TESTS PASSED!"
else
    echo "SOME TESTS FAILED. Check wiring and FPGA programming."
fi

stop_gpioset
