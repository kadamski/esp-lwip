# esp-lwip

LwIP library for ESP8266. This work is based on the LwIP code drop done
by Espressif in their SDK 0.9.4. Espressif specific changes where
reviewed, split in small, clean patches and applied on top of official
LwIP git repository.

The Espressif original code was based on LwIP 1.4.0 with some
cherry-picks so initial work for this project was also based on 1.4.0.
After confirming that it's working, all the changes were rebased on
1.4.1.

This project does not contain complete LwIP stack. The code for network
driver was not released by Espressif. It's provided in `eagle_lwip_if.o`
inside of `libmain.a`.

## Status

I've done some limited testing of this library - wifi works both in
client and in AP mode and I had no problem with running esphttpd
project. There is a need for more testing, of course. If you find any
bug, please create and Issue or PR.

## Building

1. Clone the repo.
2. Make sure your gcc toolchain is in your PATH (I'm using
[esp-open-sdk](https://github.com/pfalcon/esp-open-sdk))
3. Call `make`.
4. Put `liblwip.a` in your libraries path.

## Changes compared to Espressif release

 - The code is based on LwIP 1.4.1.
 - All the options were moved to config/lwipopts.h file which was
   cleaned and simplified.
 - The LwIP code is not marked with `ICACHE_FLASH_ATTR` but all the
   functions are moved to .irom0.text section using objcopy instead.
 - Espressif changes to LwIP code was marked by LWIP_ESP macro.
 - All Espressif specific code (dhcpserver, ping, espconn) are put in
   separate directory
 - Small fixes.

## Features added

 - `ESP_TIMEWAIT_THRESHOLD` - available heap memory is checked on each TCP
   connection accepted. If it's below this threshold, memory is
   reclaimed by killing TCP connections in TIME-WAIT state.
