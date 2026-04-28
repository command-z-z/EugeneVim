local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup(
{
    'nvim-tree/nvim-web-devicons',
    --statueline 
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons", opt = true}
    },
    -- bufferline 
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- notify
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    -- theme
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    -- file management
    {
        "Shougo/defx.nvim",
        dependencies = {
            "kristijanhusak/defx-icons", -- dexf icon
        }
    },
    --lsp
    {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    -- format and lint
    { "stevearc/conform.nvim" },
    { "mfussenegger/nvim-lint" },
    -- completion and snippets
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    -- lsp improve 
    { "glepnir/lspsaga.nvim", branch = "main"},
    -- symbols autopairs
    {"windwp/nvim-autopairs"},
    -- fuzzy search
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        }
    },
    -- search faster 
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    -- file browser
    {"nvim-telescope/telescope-file-browser.nvim" },
    --grammar highlight
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
    },
    -- start page
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {'nvim-tree/nvim-web-devicons'}
    },
    -- indent
    'lukas-reineke/indent-blankline.nvim',
    -- keymap hints
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    -- git 
    {
        'lewis6991/gitsigns.nvim'
    },
    {
        "sindrets/diffview.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        cmd = {
            "DiffviewOpen",
            "DiffviewFileHistory",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
        },
    },
    -- todo tool
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "<leader><leader>s", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },
    -- code fold
    {
       'kevinhwang91/nvim-ufo',
       dependencies = {
           'kevinhwang91/promise-async',
       }
    },
})
