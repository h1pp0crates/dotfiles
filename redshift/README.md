# redshift

This folder contains my personal configuration files for [redshift](https://github.com/jonls/redshift), a tool that adjusts the color temperature of your screen according to the time of day.

## Configuration

Edit the `redshift.conf` file in this directory to customize your location, temperature settings, and adjustment method.  
After making changes, restart redshift to apply the new configuration.

### Automatic Brightness

This folder also includes `bright_by_time.sh`, a script to automatically set screen brightness based on the current hour using `brightnessctl`.  
You can run this script manually or add it to your startup applications for automatic adjustment.

Example usage:

```sh
bash /path/to/this/folder/bright_by_time.sh
```

## Installation

On Debian/Ubuntu, install redshift and brightnessctl with:

```sh
sudo apt-get install redshift brightnessctl
```

Or build redshift from source by following instructions on the [official repository](https://github.com/jonls/redshift).

## Usage

Start redshift with your configuration:

```sh
redshift -c /path/to/this/folder/redshift.conf &
```

Run the brightness script:

```sh
bash /path/to/this/folder/bright_by_time.sh
```

Add these commands to your `.xinitrc` or window manager startup script for automatic launch.

## More Info

See the [redshift documentation](https://github.com/jonls/redshift) for details on configuration
