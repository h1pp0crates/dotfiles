# nvim

This folder contains my personal configuration files for [Neovim](https://neovim.io/).

## Plugin Installation

To install plugins using vim-plug, first download the plugin manager:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then, open Neovim and run:

```
:PlugInstall
```

## Configuration

Edit the `init.vim` file in this directory to customize your Neovim setup, plugins, and keybindings.

## More Info

See the [Neovim documentation](https://neovim.io/doc/) for details on configuration and
