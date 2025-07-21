# slstatus

This folder contains my personal configuration files for [slstatus](https://git.suckless.org/slstatus/), a lightweight status monitor for window managers.

## Configuration

**Important:**  
Edit `config.dev.h` instead of `config.h`.  
When you want to update your configuration:

1. Delete the existing `config.h`:
   ```sh
   rm config.h
   ```
2. Rebuild and install:
   ```sh
   make clean install
   ```

This will regenerate `config.h` from your changes in `config.dev.h` and apply them.

## Installation

1. Clone the slstatus repository:
   ```sh
   git clone https://git.suckless.org/slstatus
   cd slstatus
   ```
2. Copy your configuration files (including `config.dev.h`) into the cloned directory.
3. Follow the update steps above to build and install.

## Usage

Run slstatus:

```sh
slstatus &
```

Add this to your `.xinitrc` or window manager startup script for automatic
