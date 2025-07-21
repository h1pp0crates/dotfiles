# dwm

This folder contains my personal configuration files for [dwm](https://dwm.suckless.org/), a dynamic window manager for X11.

## Configuration

Edit the `config.def.h` file in this directory to customize keybindings, appearance, layouts, and other dwm settings.  
After making changes, rebuild and reinstall dwm to apply your configuration.

## Installation

On Debian/Ubuntu, install required dependencies:

```sh
sudo apt-get install build-essential libx11-dev
```

Clone the dwm repository and copy your configuration files:

```sh
git clone https://git.suckless.org/dwm
cd dwm
# Copy your config.def.h into this directory
```

Build and install:

```sh
sudo make clean install
```

## Usage

Start dwm from your display manager or by running:

```sh
startx
```

Or select dwm from your login screen session options.

## More Info

See the [dwm documentation](https://dwm.suckless.org/) for details on configuration, keybindings, and
