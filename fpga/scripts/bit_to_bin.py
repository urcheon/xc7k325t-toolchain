#!/usr/bin/env python3
import sys
import os

def convert_bit_to_bin(input_file):
    """
    Converts a Xilinx-style .bit file to a raw .bin file by stripping
    the metadata header. Output is named same as input but with .bin extension.
    """
    if not input_file.endswith(".bit"):
        print(f"Skipping {input_file}: Not a .bit file")
        return

    output_file = input_file[:-4] + ".bin"

    if not os.path.exists(input_file):
        print(f"Error: Input file {input_file} not found.")
        return

    with open(input_file, "rb") as f:
        data = f.read()

    # Search for the sync word 0xAA995566
    sync_word = b"\xAA\x99\x55\x66"
    offset = data.find(sync_word)

    if offset == -1:
        print(f"Error: Could not find sync word in {input_file}.")
        return

    with open(output_file, "wb") as f:
        f.write(data[offset:])

    print(f"Created {output_file} from {input_file}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 bit_to_bin.py <file1.bit> [file2.bit ...]")
        sys.exit(1)

    # Process all files provided in arguments
    for arg in sys.argv[1:]:
        convert_bit_to_bin(arg)
