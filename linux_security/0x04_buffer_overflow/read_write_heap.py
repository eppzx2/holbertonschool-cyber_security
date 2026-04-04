#!/usr/bin/env python3
"""
Script that finds an ASCII string in the heap of a running process
and replaces it with another string.
"""
import sys

def main():
    # Şərt: Arqumentlərin sayını yoxlayırıq
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} pid search_string replace_string")
        sys.exit(1)

    pid = sys.argv[1]
    search_str = sys.argv[2]
    replace_str = sys.argv[3]

    maps_path = f"/proc/{pid}/maps"
    mem_path = f"/proc/{pid}/mem"

    # 1. maps faylından heap-in başlanğıc və bitiş ünvanlarını tapmaq
    heap_start = None
    heap_end = None

    try:
        with open(maps_path, 'r') as maps_file:
            for line in maps_file:
                if '[heap]' in line:
                    # Sətri boşluqlara görə bölürük və ilk elementi (ünvan aralığını) alırıq
                    addr_range = line.split()[0]
                    start, end = addr_range.split('-')
                    # Hexadecimal (16-lıq) formatdan integer-ə çeviririk
                    heap_start = int(start, 16)
                    heap_end = int(end, 16)
                    break
    except Exception as e:
        print(f"Error: Could not open {maps_path}. Process might not exist.")
        sys.exit(1)

    if heap_start is None:
        print("Error: Could not find [heap] in the process maps.")
        sys.exit(1)

    print(f"[*] Found [heap] region from {hex(heap_start)} to {hex(heap_end)}")

    # 2. mem faylını açıb yaddaşı oxumaq və dəyişmək
    try:
        # Faylı read+binary rejimində açırıq
        with open(mem_path, 'r+b') as mem_file:
            # Heap-in başlanğıcına gedirik
            mem_file.seek(heap_start)
            
            # Bütün heap yaddaşını oxuyuruq
            heap_data = mem_file.read(heap_end - heap_start)
            
            # String-ləri byte formatına çeviririk
            search_bytes = search_str.encode('ascii')
            # Yeni string qısa olarsa, qalan hərflərin görünməməsi üçün null byte (\0) əlavə edirik
            replace_bytes = replace_str.encode('ascii') + b'\0'
            
            # Axtarılan sözün heap daxilindəki offset-ini (mövqeyini) tapırıq
            offset = heap_data.find(search_bytes)
            
            if offset == -1:
                print(f"Error: String '{search_str}' not found in the heap.")
                sys.exit(1)
            
            print(f"[*] Found string '{search_str}' at offset {hex(offset)}")
            
            # Yazılacaq dəqiq ünvanı hesablayırıq
            write_addr = heap_start + offset
            print(f"[*] Writing '{replace_str}' at address {hex(write_addr)}")
            
            # Dəqiq ünvana gedib yeni sözü yazırıq
            mem_file.seek(write_addr)
            mem_file.write(replace_bytes)
            
            print("[*] String successfully replaced!")

    except PermissionError:
        print("Error: Permission denied. You need root privileges (run with sudo).")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading/writing memory: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
