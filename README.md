# XC7K325T Toolchain & Loopback Test

This repository contains the build environment, synthesis toolchain, and test scripts for the QMTech XC7K325T FPGA Core board. The build process is containerized using Docker to ensure a consistent toolchain (Yosys, NextPNR, Bambu HLS, openFPGALoader), orchestrated via CMake.

## 1. Build the Docker Toolchain

Before building the FPGA bitstreams, you need to build the Docker image containing the necessary tools.

Navigate to the directory containing the Dockerfile and build the image, tagging it as `xc7k325t-toolchain` (which CMake expects):

```bash
cd fpga/docker
docker build -t xc7k325t-toolchain .
```

*(Note: Building this image from source will take significant time as it compiles LLVM, Bambu HLS, Yosys, NextPNR, and openFPGALoader.)*

## 2. Configure and Build with CMake

The build is orchestrated using CMake, which maps your local project directory into the Docker container and runs the synthesis steps.

From the project root directory:

```bash
# Create a build directory
mkdir build
cd build

# Configure the project
cmake ..

# Build all FPGA bitstreams (loopback_v and loopback_hls)
make build_all
```

The resulting `.bit` and `.bin` files will be placed in the `bin/` directory at the project root.

## 3. Flashing the FPGA

To flash the FPGA, ensure your JTAG programmer is connected to your host machine. We have provided a `flash_fpga` CMake target that automatically handles the privileged Docker execution and USB passthrough. You simply pass the file and any extra flags using the `LOADER_ARGS` variable.

From the `build` directory:

**Write to SRAM (Volatile - using .bit):**

```bash
make flash_fpga LOADER_ARGS="-c ft232 bin/loopback_v.bit"
```

**Write to Flash (Non-Volatile - using .bin):**

```bash
make flash_fpga LOADER_ARGS="-c ft232 -f bin/loopback_v.bin"
```

*(Note: Depending on your specific JTAG hardware, you may need to change -c ft232 to -c digilent, -c ch347, or another supported cable type.)*

## 4. Hardware Setup & Testing

The test suite verifies the functionality of the synthesized logic using a Raspberry Pi (or similar SBC) connected to the FPGA via GPIO.

### Wiring Requirements

Connect the Pi GPIOs to the FPGA `GPIO U4` header as follows:

| Raspberry Pi | FPGA Header (GPIO U4) | Signal Description |
| --- | --- | --- |
| **GND** | **GND** | Common Ground |
| **GPIO 17** | **Pin 7** (GPIO_U4[7]) | Switch state output from FPGA (Test 1) |
| **GPIO 27** | **Pin 8** (GPIO_U4[8]) | Loopback input *to* FPGA (Test 2) |
| **GPIO 22** | **Pin 9** (GPIO_U4[9]) | Loopback output *from* FPGA (Test 2) |

*(Note: The test scripts use BCM numbering for the Pi GPIOs.)*

### Running the Tests

Ensure the FPGA is powered and programmed with one of the generated bitstreams (e.g., `bin/loopback_v.bit` or `bin/loopback_hls.bit`) before running the tests.

You can run either the Bash or Python version of the test script. Both tests require root privileges for raw GPIO access.

**Using Bash (sysfs):**

```bash
sudo ./scripts/loopback_test.sh
```

**Using Python (RPi.GPIO):**

```bash
sudo ./scripts/loopback_test.py
```

Follow the on-screen prompts. Test 1 will ask you to physically press `SW3` on the FPGA board. Test 2 will automatically run a high/low signal loopback test between the Pi and the FPGA. Additionally, during the test, `LED2` on the board will flash every 1 second to indicate the clock is running.
