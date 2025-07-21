# polybar

This folder contains my personal configuration files for [polybar](https://github.com/polybar/polybar), a fast and easy-to-use status bar for desktop environments and window managers.

## Configuration

Edit the `config` file in this directory to customize modules, appearance, and behavior.  
You can also modify or add scripts in the `scripts` subdirectory for custom modules.

After making changes, restart polybar to apply the new configuration.

## Installation

On Debian/Ubuntu, install polybar with:

```sh
sudo apt-get install polybar
```

Or build from source by following instructions on the [official repository](https://github.com/polybar/polybar).

## Usage

Start polybar with your configuration:

```sh
polybar -c /path/to/this/folder/config mybar &
```

Replace `mybar` with the name of your bar as defined in the config file.

Add this command to your `.xinitrc` or window manager startup script for automatic launch.

## More Info

See the [polybar documentation](https://github.com/polybar/polybar/wiki) for details on configuration options and
