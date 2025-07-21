# .dwm

This folder contains my personal autostart script for [dwm](https://dwm.suckless.org/).

## Autostart

Place your autostart script (commonly named `autostart.sh`) in this directory.  
This script will be executed automatically when dwm starts, allowing you to launch background services, set environment variables, or start applications.

## Usage

Make sure your autostart script is executable:

```sh
chmod +x autostart.sh
```

dwm will run this script automatically if configured with the autostart patchp.

## More Info

See the [dwm autostart patch](https://dwm.suckless.org/patches/autostart/) for details on enabling autostart
