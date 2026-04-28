# Eugene Neovim Config

<p align="center">
  <a href="https://github.com/command-z-z/EugeneVim/stargazers">
    <img alt="Stargazers" src="https://img.shields.io/github/stars/command-z-z/EugeneVim?style=for-the-badge&logo=starship&color=c678dd&logoColor=d9e0ee&labelColor=282a36" />
  </a>
  <a href="https://github.com/command-z-z/EugeneVim/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/command-z-z/EugeneVim?style=for-the-badge&logo=gitbook&color=f0c062&logoColor=d9e0ee&labelColor=282a36" />
  </a>
  <a href="https://github.com/command-z-z/EugeneVim/blob/master/LICENSE">
    <img alt="License" src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=282a36&colorB=c678dd" />
  </a>
</p>

A personal Neovim configuration built around `lazy.nvim`, modern LSP APIs, Telescope, blink.cmp, Catppuccin, and a small set of focused editing tools.

The config is intentionally modular so it is easy to fork, trim, or extend.

## Screenshot

<p align="center">
  <img src="./img/dashboard.png" width="75%" />
</p>

## Requirements

- Neovim 0.12 or newer
- `git`
- `ripgrep` for Telescope search and TODO search
- `make` and a C compiler for `telescope-fzf-native.nvim`
- Node.js and npm for some Mason tools
- Python 3 for Python tooling
- Optional: `lazygit` for `<leader>gg`

## Installation

Back up your existing Neovim config first:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone this repository:

```sh
git clone https://github.com/command-z-z/EugeneVim.git ~/.config/nvim
```

Start Neovim and let `lazy.nvim` install the plugins:

```sh
nvim
```

Then open Mason and install missing tools if needed:

```vim
:Mason
```

## Structure

```text
init.lua
lua/
  options.lua
  mappings.lua
  plugins/
    init.lua
    ui.lua
    editor.lua
    search.lua
    lsp.lua
    git.lua
snippets/
```

`lua/plugins/init.lua` bootstraps `lazy.nvim` and imports plugin groups. Each plugin group owns its lazy-loading rules, options, and keymaps.

## Plugin Stack

- UI: Catppuccin, lualine, bufferline, dashboard-nvim, noice.nvim, indent-blankline, which-key
- Search: Telescope, telescope-fzf-native, telescope-file-browser, todo-comments
- Editing: nvim-treesitter, nvim-ufo, nvim-autopairs, flash.nvim, persistence.nvim
- Completion: blink.cmp, friendly-snippets, local snippets
- LSP and tools: nvim-lspconfig, Mason, mason-lspconfig, mason-tool-installer, conform.nvim, nvim-lint, Trouble
- Git and terminal: gitsigns.nvim, diffview.nvim, toggleterm.nvim

## Language Support

Configured LSP servers:

- Python: `pyright`
- Lua: `lua_ls`
- C/C++: `clangd`
- Rust: `rust_analyzer`
- Go: `gopls`

Configured formatters and linters:

- Lua: `stylua`
- Python: `ruff`
- C/C++: `clang-format`
- Shell: `shfmt`
- Markdown: `markdownlint`

Mason installs the configured tools on startup when possible.

## Keymaps

Leader is `<Space>`.

| Key | Action |
| --- | --- |
| `<leader>w` | Save file |
| `<C-s>` | Save file |
| `<leader>ws` | Horizontal split |
| `<leader>wv` | Vertical split |
| `<leader>wh/j/k/l` | Move between windows |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>bb` | Find buffers |
| `<leader>bd` | Delete buffer |
| `<leader>1..9` | Jump to buffer number |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | File browser |
| `<leader>fo` | Recent files |
| `<leader>fF` | Find files from current buffer directory |
| `<leader>fG` | Live grep from current buffer directory |
| `<leader>cf` | Format buffer |
| `<leader>cl` | Lint buffer |
| `<leader>cx` | Workspace diagnostics |
| `<leader>cX` | Buffer diagnostics |
| `gd` | Go to definition |
| `gr` | Rename symbol |
| `K` | Hover documentation |
| `<leader>gd` | Open Diffview |
| `<leader>gh` | Current file history |
| `<leader>gH` | Repository history |
| `<leader>gp` | Preview git hunk |
| `<leader>gb` | Git blame line |
| `<leader>tt` | Floating terminal |
| `<leader>gg` | Lazygit |
| `<leader>qs` | Restore session |
| `<leader>ql` | Restore last session |
| `<leader>qd` | Stop session persistence |
| `<leader>s` | Flash jump |
| `zR` / `zM` | Open / close all folds |
| `zp` | Preview folded lines |

## Health Check

Useful commands when something breaks:

```vim
:Lazy
:Lazy profile
:checkhealth lazy
:checkhealth vim.lsp
:checkhealth nvim-treesitter
:Mason
:ConformInfo
```

For a quick headless smoke test:

```sh
nvim --headless '+lua print("config loaded")' '+qa'
```

## Customization

- Add plugins in the matching file under `lua/plugins/`.
- Add language servers and tools in `lua/plugins/lsp.lua`.
- Add editor options in `lua/options.lua`.
- Add global keymaps in `lua/mappings.lua`.
- Add snippets under `snippets/`.

Keep plugin config inside lazy specs when possible. It keeps load order, keymaps, and options in one place.

## Notes

This config tracks current Neovim APIs and targets Neovim 0.12+. If you need compatibility with older Neovim releases, the LSP setup will need changes.

## License

MIT

---

# Eugene Neovim 配置

这是一个个人 Neovim 配置，基于 `lazy.nvim`、现代 LSP API、Telescope、blink.cmp、Catppuccin 和一组轻量但实用的编辑工具构建。

配置已经按功能模块拆分，方便 fork、删减和扩展。

## 截图

<p align="center">
  <img src="./img/dashboard.png" width="75%" />
</p>

## 环境要求

- Neovim 0.12 或更新版本
- `git`
- `ripgrep`，用于 Telescope 搜索和 TODO 搜索
- `make` 和 C 编译器，用于编译 `telescope-fzf-native.nvim`
- Node.js 和 npm，部分 Mason 工具需要
- Python 3，用于 Python 工具链
- 可选：`lazygit`，用于 `<leader>gg`

## 安装

先备份现有 Neovim 配置：

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

克隆本仓库：

```sh
git clone https://github.com/command-z-z/EugeneVim.git ~/.config/nvim
```

启动 Neovim，让 `lazy.nvim` 自动安装插件：

```sh
nvim
```

如需检查或手动安装工具，打开 Mason：

```vim
:Mason
```

## 目录结构

```text
init.lua
lua/
  options.lua
  mappings.lua
  plugins/
    init.lua
    ui.lua
    editor.lua
    search.lua
    lsp.lua
    git.lua
snippets/
```

`lua/plugins/init.lua` 负责启动 `lazy.nvim` 并导入插件分组。每个插件分组都维护自己的懒加载规则、配置和快捷键。

## 插件栈

- 界面：Catppuccin、lualine、bufferline、dashboard-nvim、noice.nvim、indent-blankline、which-key
- 搜索：Telescope、telescope-fzf-native、telescope-file-browser、todo-comments
- 编辑：nvim-treesitter、nvim-ufo、nvim-autopairs、flash.nvim、persistence.nvim
- 补全：blink.cmp、friendly-snippets、本地 snippets
- LSP 和工具链：nvim-lspconfig、Mason、mason-lspconfig、mason-tool-installer、conform.nvim、nvim-lint、Trouble
- Git 和终端：gitsigns.nvim、diffview.nvim、toggleterm.nvim

## 语言支持

已配置的 LSP：

- Python：`pyright`
- Lua：`lua_ls`
- C/C++：`clangd`
- Rust：`rust_analyzer`
- Go：`gopls`

已配置的格式化和检查工具：

- Lua：`stylua`
- Python：`ruff`
- C/C++：`clang-format`
- Shell：`shfmt`
- Markdown：`markdownlint`

Mason 会在启动时尽可能自动安装这些工具。

## 快捷键

Leader 键是 `<Space>`。

| 快捷键 | 功能 |
| --- | --- |
| `<leader>w` | 保存文件 |
| `<C-s>` | 保存文件 |
| `<leader>ws` | 水平分屏 |
| `<leader>wv` | 垂直分屏 |
| `<leader>wh/j/k/l` | 在窗口间移动 |
| `<Tab>` / `<S-Tab>` | 下一个 / 上一个 buffer |
| `<leader>bb` | 使用 Telescope 查找 buffer |
| `<leader>bd` | 删除 buffer |
| `<leader>1..9` | 跳转到指定编号 buffer |
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 全局文本搜索 |
| `<leader>fb` | 文件浏览器 |
| `<leader>fo` | 最近打开文件 |
| `<leader>fF` | 从当前 buffer 目录查找文件 |
| `<leader>fG` | 从当前 buffer 目录搜索文本 |
| `<leader>cf` | 格式化当前 buffer |
| `<leader>cl` | 检查当前 buffer |
| `<leader>cx` | 工作区诊断 |
| `<leader>cX` | 当前 buffer 诊断 |
| `gd` | 跳转到定义 |
| `gr` | 重命名符号 |
| `K` | 查看悬浮文档 |
| `<leader>gd` | 打开 Diffview |
| `<leader>gh` | 当前文件 Git 历史 |
| `<leader>gH` | 仓库 Git 历史 |
| `<leader>gp` | 预览 Git hunk |
| `<leader>gb` | 查看当前行 blame |
| `<leader>tt` | 浮动终端 |
| `<leader>gg` | Lazygit |
| `<leader>qs` | 恢复 session |
| `<leader>ql` | 恢复上一次 session |
| `<leader>qd` | 停止 session 保存 |
| `<leader>s` | Flash 跳转 |
| `zR` / `zM` | 打开 / 关闭所有折叠 |
| `zp` | 预览折叠内容 |

## 健康检查

排查问题时常用命令：

```vim
:Lazy
:Lazy profile
:checkhealth lazy
:checkhealth vim.lsp
:checkhealth nvim-treesitter
:Mason
:ConformInfo
```

快速 headless 启动检查：

```sh
nvim --headless '+lua print("config loaded")' '+qa'
```

## 自定义

- 在 `lua/plugins/` 下对应模块中添加插件。
- 在 `lua/plugins/lsp.lua` 中添加语言服务器和工具链。
- 在 `lua/options.lua` 中添加编辑器选项。
- 在 `lua/mappings.lua` 中添加全局快捷键。
- 在 `snippets/` 中添加本地 snippets。

尽量把插件配置放在 lazy spec 中，这样加载时机、快捷键和配置会集中在同一个地方。

## 说明

这套配置跟随当前 Neovim API，目标版本是 Neovim 0.12+。如果需要兼容旧版本 Neovim，需要调整 LSP 配置。

## 许可证

MIT
