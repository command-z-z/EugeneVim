# EugeneTermial

# My Terminal Config

<!-- ## Try out this config

Make sure to remove or move your current `nvim` directory

```sh
mkdir ~/.config/
git clone https://github.com/command-z-z/EugeneNvim.git
```

Run `nvim` and wait for the plugins to be installed

**NOTE:** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) -->

## Use zsh config

run following code install my zsh config

```
./install_zsh.sh

```

## Use ranger config

run following code install my ranger config

```
./install_ranger.sh

```

## Use nvim config

run following code install my nvim config

```
./install_nvim.sh
```

Now, you can `cd ~/.config/nvim/lua/plugins.lua`, and type `:PackerInstall`

So, try my config quick!

And you can see all my blogs with Keymap and how to install for nvim in following:

- [vim练级手册(零) --- nvim安装(先导篇)](https://command-z-z.github.io/2021/12/05/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C-%E4%B8%80/)
- [vim练级手册(一) ---基本配置](https://command-z-z.github.io/2022/03/21/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C-%E4%B8%80-1/)
- [vim练级手册（二）---模式讲解](https://command-z-z.github.io/2022/03/24/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C%EF%BC%88%E4%BA%8C%EF%BC%89/)
- [vim练级手册（三） ---界面美化](https://command-z-z.github.io/2022/03/25/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C%EF%BC%88%E4%B8%89%EF%BC%89-%E7%95%8C%E9%9D%A2%E7%BE%8E%E5%8C%96/)
- [vim练级手册（四） ---ranger文件管理插件](https://command-z-z.github.io/2022/04/04/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C%EF%BC%88%E5%9B%9B%EF%BC%89-ranger%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86%E6%8F%92%E4%BB%B6/)
- [vim练级手册（五） ---defx文件管理与vim-choosewin窗口选择](https://command-z-z.github.io/2022/04/22/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C%EF%BC%88%E4%BA%94%EF%BC%89-defx%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86%E4%B8%8Evim-choosewin%E7%AA%97%E5%8F%A3%E9%80%89%E6%8B%A9/)
- [vim练级手册（六） ---markdown预览插件](https://command-z-z.github.io/2022/04/23/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C%EF%BC%88%E5%85%AD%EF%BC%89-markdown%E9%A2%84%E8%A7%88%E6%8F%92%E4%BB%B6/)
- [vim练级手册（七） ---telescope文件模糊搜索](https://command-z-z.github.io/2022/04/23/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C%EF%BC%88%E4%B8%83%EF%BC%89-telescope%E6%96%87%E4%BB%B6%E6%A8%A1%E7%B3%8A%E6%90%9C%E7%B4%A2/)
- [vim练级手册（八） ---symbols_outline大纲视图](https://command-z-z.github.io/2022/06/20/vim%E7%BB%83%E7%BA%A7%E6%89%8B%E5%86%8C%EF%BC%88%E5%85%AB%EF%BC%89-symbols-outline%E5%A4%A7%E7%BA%B2%E8%A7%86%E5%9B%BE/)
- [vim拓展---zsh插件（vi-mode)](https://command-z-z.github.io/2022/06/16/vim%E6%8B%93%E5%B1%95-zsh%E6%8F%92%E4%BB%B6%EF%BC%88vi-mode%EF%BC%89/)
- [vim拓展-作为macOS Finder的打开方式](https://command-z-z.github.io/2022/08/13/vim-%E4%BD%9C%E4%B8%BAmacOS-Finder%E7%9A%84%E6%89%93%E5%BC%80%E6%96%B9%E5%BC%8F/)

### Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```


- Neovim python support

  ```sh
  pip3 install pynvim
  pip3 install neovim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```
- Neovim ranger support

```sh
pip3 install Ranger-fm
```

- Neovim telescope support

```sh
yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
yum install ripgrep
```
