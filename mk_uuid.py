#!/usr/bin/python3
#
# @file   mk_uuid.py
# @author David Weber david.weber.dfw@gmail.com
# @date   12/29/2024
#
# @brief mk_uuid module implementation
#
# Copyright (C) 2024 David Weber
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import uuid
import argparse

def generate_uuid():
    """Generate a unique 128-bit UUID."""
    return uuid.uuid4()

def uuid_to_c_array(uuid_obj):
    """Convert a UUID object to a C uint8_t array format."""
    return ', '.join(f'0x{b:02X}' for b in uuid_obj.bytes)

def generate_c_code(uuids, num_uuids):
    """Generate C code that declares and initializes uint8_t arrays for each UUID."""
    c_code = []
    for i in range(num_uuids):
        uuid_var_name = f"uuid_{i+1}"
        c_code.append(f"uint8_t {uuid_var_name}[16] = {{ {uuids[i]} }};")
    return '\n'.join(c_code)

def main():
    # Parse command line arguments
    parser = argparse.ArgumentParser(description="Generate unique BLE 128-bit UUIDs for use in C programs.")
    parser.add_argument("-n", "--num", type=int, default=1, help="Number of UUIDs to generate.")
    args = parser.parse_args()
    
    # Generate UUIDs
    uuids = []
    for _ in range(args.num):
        new_uuid = generate_uuid()
        uuid_c_array = uuid_to_c_array(new_uuid)
        uuids.append(uuid_c_array)

    # Generate C code
    c_code = generate_c_code(uuids, args.num)
    print(c_code)

if __name__ == "__main__":
    main()

