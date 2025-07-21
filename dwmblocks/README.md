# dwmblocks

This folder contains my personal configuration files and scripts for [dwmblocks](https://github.com/torrinfail/dwmblocks), a modular status bar for the dwm window manager.

## Configuration

Edit the `blocks.def.h` file in this directory to customize the modules, update intervals, and commands shown in your status bar.  
You can also modify or add scripts used by individual blocks for custom functionality.

After making changes, rebuild and reinstall dwmblocks to apply your configuration.

## Installation

On Debian/Ubuntu, install required dependencies:

```sh
sudo apt-get install build-essential libx11-dev
```

Clone the dwmblocks repository and copy your configuration files:

```sh
git clone https://github.com/torrinfail/dwmblocks.git
cd dwmblocks
# Copy your blocks.def.h and scripts into this directory
```

Build and install:

```sh
sudo make clean install
```

## Usage

Start dwmblocks by adding it to your `.xinitrc` or window manager startup script:

```sh
dwmblocks &
```

## More Info

See the [dwmblocks repository](https://github.com/torrinfail/dwmblocks) for details on configuration and
