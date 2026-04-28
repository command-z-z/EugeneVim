# 🧭 Eugene Neovim Config

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

> 🇨🇳 Chinese documentation: [README_CN.md](./README_CN.md)

A personal Neovim configuration built around `lazy.nvim`, modern LSP APIs, Telescope, blink.cmp, Catppuccin, and a focused editing workflow.

## 📸 Screenshot

<p align="center">
  <img src="./img/dashboard.png" width="75%" />
</p>

## ✨ Features

- Modular `lazy.nvim` plugin specs
- Telescope-first search workflow
- LSP, completion, formatting, and linting out of the box
- Git workflow with Gitsigns and Diffview
- Floating terminal and optional Lazygit integration
- Session restore, folding, snippets, and dashboard support

## 🧰 Requirements

- Neovim 0.12 or newer
- `git`
- `ripgrep` for Telescope search and TODO search
- `make` and a C compiler for `telescope-fzf-native.nvim`
- Node.js and npm for some Mason tools
- Python 3 for Python tooling
- Optional: `lazygit` for `<leader>gg`

## 🚀 Installation

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

## 🗂️ Structure

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

## 🔌 Plugin Stack

- UI: Catppuccin, lualine, bufferline, dashboard-nvim, noice.nvim, indent-blankline, which-key
- Search: Telescope, telescope-fzf-native, telescope-file-browser, todo-comments
- Editing: nvim-treesitter, nvim-ufo, nvim-autopairs, flash.nvim, persistence.nvim
- Completion: blink.cmp, friendly-snippets, local snippets
- LSP and tools: nvim-lspconfig, Mason, mason-lspconfig, mason-tool-installer, conform.nvim, nvim-lint, Trouble
- Git and terminal: gitsigns.nvim, diffview.nvim, toggleterm.nvim

## 🧠 Language Support

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

## ⌨️ Keymaps

Leader is `<Space>`.

### 💾 Files And Config

| Key | Action |
| --- | --- |
| `<C-s>` | Save file |
| `<leader>ee` | Edit Neovim config |
| `Q` | Quit current window |

### 🪟 Windows

| Key | Action |
| --- | --- |
| `<leader>ws` | Split window horizontally |
| `<leader>wv` | Split window vertically |
| `<leader>wh` | Move to left window |
| `<leader>wj` | Move to lower window |
| `<leader>wk` | Move to upper window |
| `<leader>wl` | Move to right window |
| `<M-left>` | Decrease window width |
| `<M-right>` | Increase window width |
| `<M-up>` | Increase window height |
| `<M-down>` | Decrease window height |

### 📚 Buffers

| Key | Action |
| --- | --- |
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>bb` | Find buffers with Telescope |
| `<leader>bd` | Delete buffer |
| `<leader>1` to `<leader>9` | Jump to buffer number |

### 🔎 Search

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fh` | Find help tags |
| `<leader>fo` | Find old files |
| `<leader>fb` | File browser |
| `<leader>fB` | File browser from current buffer directory |
| `<leader>fF` | Find files from current buffer directory |
| `<leader>fG` | Live grep from current buffer directory |
| `<leader>ft` | Find TODO comments |
| `<leader>s` | Flash jump |
| `<leader><leader>s` | Flash Treesitter jump |

### ✍️ Editing

| Key | Mode | Action |
| --- | --- | --- |
| `jk` | Insert | Exit insert mode |
| `<C-h>` | Insert | Move cursor left |
| `<C-j>` | Insert | Move cursor down |
| `<C-k>` | Insert | Move cursor up |
| `<C-l>` | Insert | Move cursor right |
| `<C-d>` | Insert | Delete next character |
| `H` | Normal / Visual | Go to first non-blank character |
| `L` | Normal / Visual | Go to end of line |
| `<C-h>` | Normal / Visual / Operator | Move left 5 characters |
| `<C-j>` | Normal / Visual / Operator | Move down 5 lines |
| `<C-k>` | Normal / Visual / Operator | Move up 5 lines |
| `<C-l>` | Normal / Visual / Operator | Move right 5 characters |
| `<C-a>` | Normal | Select all |
| `<leader>y` | Normal | Yank to system clipboard |
| `<leader>p` | Normal | Paste from system clipboard |

### 🧩 Completion

| Key | Action |
| --- | --- |
| `<C-n>` | Select next completion item |
| `<C-p>` | Select previous completion item |
| `<C-space>` | Show completion or documentation |
| `<C-e>` | Hide completion menu |
| `<CR>` | Accept completion item |
| `<Tab>` | Select next item or jump forward in snippet |
| `<S-Tab>` | Select previous item or jump backward in snippet |

### 🧪 Code And LSP

| Key | Action |
| --- | --- |
| `gd` | Go to definition |
| `gr` | Rename symbol |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `<leader>cl` | Lint buffer |
| `<leader>cx` | Workspace diagnostics |
| `<leader>cX` | Current buffer diagnostics |
| `<leader>o` | Document symbols |

### 🌿 Git

| Key | Action |
| --- | --- |
| `<leader>gd` | Open Diffview |
| `<leader>gh` | Current file Git history |
| `<leader>gH` | Repository Git history |
| `<leader>gq` | Close Diffview |
| `<leader>gp` | Preview hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gb` | Blame current line |
| `<leader>gf` | Diff current file |
| `<leader>gB` | Toggle line blame |
| `<leader>gL` | Toggle deleted lines |

### 🖥️ Terminal

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>tt` | Normal | Toggle floating terminal |
| `<leader>gg` | Normal | Toggle Lazygit |
| `<C-\>` | Normal / Terminal | Toggle terminal |
| `<Esc>` | Terminal | Exit terminal mode |

### 🧷 Session And Folds

| Key | Action |
| --- | --- |
| `<leader>qs` | Restore session |
| `<leader>ql` | Restore last session |
| `<leader>qd` | Stop session persistence |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zp` | Preview folded lines |

## 🩺 Health Check

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

## 🛠️ Customization

- Add plugins in the matching file under `lua/plugins/`.
- Add language servers and tools in `lua/plugins/lsp.lua`.
- Add editor options in `lua/options.lua`.
- Add global keymaps in `lua/mappings.lua`.
- Add snippets under `snippets/`.

Keep plugin config inside lazy specs when possible. It keeps load order, keymaps, and options in one place.

## 📝 Notes

This config tracks current Neovim APIs and targets Neovim 0.12+. If you need compatibility with older Neovim releases, the LSP setup will need changes.

## 📄 License

MIT
