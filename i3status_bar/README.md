# i3status_bar

This folder contains my personal configuration files for [i3status](https://github.com/i3/i3status), a status bar generator for the i3 window manager.

## Configuration

Edit the `config` file in this directory to customize the modules, output format, and update interval for your status bar.  
After making changes, restart i3 or reload your i3 configuration to apply the new settings.

## Installation

On Debian/Ubuntu, install i3status with:

```sh
sudo apt-get install i3status
```

## Usage

i3status is typically started automatically by i3 through your i3 configuration file.  
Make sure your i3 config includes a line like:

```
bar {
    status_command i3status
}
```

You can specify the path to your custom config file with:

```sh
i3status -c /path/to/this/folder/config
```

## More Info

See the [i3status documentation](https://i3wm.org/i3status/) for details on configuration
