pio pkg exec -p "tool-esptoolpy" -- esptool.py --chip ESP32-C3 merge_bin -o merged-flash.bin `
    --flash_mode dio --flash_size 4MB `
     0x00 .pio\build\esp32-c3-devkitm-1\bootloader.bin `
     0x8000 .pio\build\esp32-c3-devkitm-1\partitions.bin `
     0x10000 .pio\build\esp32-c3-devkitm-1\firmware.bin