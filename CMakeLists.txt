cmake_minimum_required(VERSION 3.10)

project(fpga_loopback LANGUAGES NONE)

# Environment & Path Config
set(DOCKER_IMAGE "xc7k325t-toolchain")
set(BIN_OUT_DIR ${CMAKE_SOURCE_DIR}/bin)
file(MAKE_DIRECTORY ${BIN_OUT_DIR})

# FPGA Bitstream Orchestration (Linux/Docker)
if(UNIX AND NOT APPLE)
    find_program(DOCKER_EXECUTABLE docker)
    if(DOCKER_EXECUTABLE)
        # Get host UID/GID at configure time
        execute_process(COMMAND id -u OUTPUT_VARIABLE HOST_UID OUTPUT_STRIP_TRAILING_WHITESPACE)
        execute_process(COMMAND id -g OUTPUT_VARIABLE HOST_GID OUTPUT_STRIP_TRAILING_WHITESPACE)

        set(DOCKER_BASE
            ${DOCKER_EXECUTABLE} run
            --user "${HOST_UID}:${HOST_GID}"
            --rm
            -v ${CMAKE_SOURCE_DIR}:/work
            -v ${CMAKE_SOURCE_DIR}/build:/work/fpga/build
            -v ${CMAKE_SOURCE_DIR}/bin:/work/fpga/bin
        )

        set(DOCKER_RUN     ${DOCKER_BASE} -w /work/fpga ${DOCKER_IMAGE})
        set(DOCKER_RUN_USB ${DOCKER_BASE} -w /work --privileged -v /dev/bus/usb:/dev/bus/usb ${DOCKER_IMAGE})

        add_custom_target(bitstream_loopback_v COMMAND ${DOCKER_RUN} make loopback_v)
        add_custom_target(bitstream_loopback_hls COMMAND ${DOCKER_RUN} make loopback_hls)

        add_custom_target(fpga_bins
            COMMAND ${DOCKER_RUN} sh -c "python3 scripts/bit_to_bin.py bin/*.bit"
            DEPENDS bitstream_loopback_v bitstream_loopback_hls
        )

        # Target to flash the FPGA. Uses Make variable LOADER_ARGS to pass the file and flags.
        add_custom_target(flash_fpga
            COMMAND ${DOCKER_RUN_USB} openFPGALoader $(LOADER_ARGS)
            USES_TERMINAL
        )

        list(APPEND ALL_DEPS fpga_bins)
    else()
        message(STATUS "Docker executable not found")
    endif()
else()
    message(STATUS "Not unix")
endif()

# Global build
add_custom_target(build_all ALL DEPENDS ${ALL_DEPS})

set_property(DIRECTORY PROPERTY ADDITIONAL_CLEAN_FILES
    ${CMAKE_SOURCE_DIR}/bin
    ${CMAKE_SOURCE_DIR}/build
)