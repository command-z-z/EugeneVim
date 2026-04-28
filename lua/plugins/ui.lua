return {
    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
                show_end_of_buffer = false,
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                integrations = {
                    blink_cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    notify = true,
                    dashboard = true,
                    bufferline = true,
                    indent_blankline = { enabled = true },
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local function lsp_status()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if next(clients) == nil then
                    return "No Active Lsp"
                end

                local buf_ft = vim.bo.filetype
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.tbl_contains(filetypes, buf_ft) then
                        return client.name
                    end
                end

                return "No Active Lsp"
            end

            require("lualine").setup({
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff" },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
                        },
                        lsp_status,
                        "filetype",
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                options = {
                    icons_enabled = true,
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard" } },
                    theme = "catppuccin",
                },
            })
        end,
    },

    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = function()
            local keys = {
                { "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete buffer" },
                { "<Tab>", "<cmd>bnext<CR>", desc = "Next buffer" },
                { "<S-Tab>", "<cmd>bprevious<CR>", desc = "Previous buffer" },
            }

            for i = 1, 9 do
                keys[#keys + 1] = {
                    "<leader>" .. i,
                    "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
                    desc = "Go to buffer " .. i,
                }
            end

            return keys
        end,
        opts = {
            options = {
                close_command = "bdelete! %d",
                modified_icon = "*",
                max_name_length = 18,
                max_prefix_length = 12,
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "thin",
                always_show_bufferline = true,
            },
        },
    },

    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup({
                theme = "doom",
                config = {
                    header = {
                        "",
                        "",
                        "          ▀████▀▄▄              ▄█ ",
                        "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
                        "    ▄        █          ▀▀▀▀▄  ▄▀  ",
                        "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
                        "  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
                        "  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
                        "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
                        "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
                        "   █   █  █      ▄▄           ▄▀   ",
                        "",
                    },
                    center = {
                        { icon = "S  ", desc = "Restore Session            ", key = "SPC q s", action = "lua require('persistence').load()" },
                        { icon = "F  ", desc = "Find File                  ", key = "SPC f f", action = "Telescope find_files" },
                        { icon = "G  ", desc = "Find Word                  ", key = "SPC f g", action = "Telescope live_grep" },
                        { icon = "B  ", desc = "File Browser               ", key = "SPC f b", action = "Telescope file_browser" },
                        { icon = "E  ", desc = "Edit Config                ", key = "SPC e e", action = "edit $MYVIMRC" },
                    },
                    footer = { "", "Eugene Neovim Config" },
                },
            })
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = { char = "|" },
            exclude = {
                filetypes = {
                    "dashboard",
                    "gitcommit",
                    "markdown",
                    "json",
                    "txt",
                    "help",
                    "git",
                    "TelescopePrompt",
                },
                buftypes = { "terminal", "nofile", "prompt" },
            },
            scope = { enabled = false },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
            delay = 500,
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.add({
                { "<leader>b", group = "buffer" },
                { "<leader>c", group = "code" },
                { "<leader>e", group = "edit" },
                { "<leader>f", group = "find" },
                { "<leader>g", group = "git" },
                { "<leader>q", group = "session" },
                { "<leader>t", group = "terminal" },
                { "<leader>w", group = "window/write" },
            })
        end,
    },
}
