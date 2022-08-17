# EugeneNvim

# My Neovim Config

## Try out this config

Make sure to remove or move your current `nvim` directory

```sh
mkdir ~/.config/
git clone https://github.com/command-z-z/EugeneNvim.git ~/.config/
```

Run `nvim` and wait for the plugins to be installed

**NOTE:** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Use install.sh

I also write a install script, you can easier install my config



## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```


- Neovim python support

  ```sh
  pip install pynvim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)

After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

**NOTE:** (If you are seeing boxes without icons, try changing this line from `false` to `true`: [link](https://github.com/ChristianChiarulli/nvim/blob/ac41efa237caf3a498077df19a3f31ca4b35caf3/lua/user/icons.lua#L5))

