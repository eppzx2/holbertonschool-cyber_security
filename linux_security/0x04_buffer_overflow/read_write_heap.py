#!/usr/bin/python3

"""
Script that finds an ASCII string in the heap of a running process
and replaces it with another string.
"""
import sys

def main():
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} pid search_string replace_string")
        sys.exit(1)

    pid = sys.argv[1]
    search_str = sys.argv[2]
    replace_str = sys.argv[3]

    maps_path = f"/proc/{pid}/maps"
    mem_path = f"/proc/{pid}/mem"

    heap_start = None
    heap_end = None

    try:
        with open(maps_path, 'r') as maps_file:
            for line in maps_file:
                if '[heap]' in line:
                    addr_range = line.split()[0]
                    start, end = addr_range.split('-')
                    heap_start = int(start, 16)
                    heap_end = int(end, 16)
                    break
    except Exception as e:
        print(f"Error: Could not open {maps_path}.")
        sys.exit(1)

    if heap_start is None:
        print("Error: Could not find [heap] in the process maps.")
        sys.exit(1)

    try:
        with open(mem_path, 'r+b') as mem_file:
            mem_file.seek(heap_start)
            heap_data = mem_file.read(heap_end - heap_start)
            
            search_bytes = search_str.encode('ascii')
            # Yeni string qısa olarsa, sonuna null byte əlavə edirik
            replace_bytes = replace_str.encode('ascii') + b'\0'
            
            offset = heap_data.find(search_bytes)
            
            if offset == -1:
                print(f"Error: String '{search_str}' not found in the heap.")
                sys.exit(1)
            
            write_addr = heap_start + offset
            
            mem_file.seek(write_addr)
            mem_file.write(replace_bytes)

    except PermissionError:
        print("Error: Permission denied. You need root privileges.")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading/writing memory: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
