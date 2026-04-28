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
            local lsp_status = {
                function()
                    local msg = "No Active Lsp"
                    local buf_ft = vim.bo.filetype
                    local clients = vim.lsp.get_clients({ bufnr = 0 })
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.tbl_contains(filetypes, buf_ft) then
                            return client.name
                        end
                    end
                    return msg
                end,
                color = "StatusLine",
                separator = { left = "", right = "" },
            }

            local layout = {
                lualine_a = {
                    {
                        function()
                            return ""
                        end,
                        separator = { left = "", right = "" },
                    },
                },
                lualine_b = {
                    {
                        "filetype",
                        icon_only = true,
                        colored = true,
                        color = "StatusLine",
                    },
                    {
                        "filename",
                        color = "StatusLine",
                    },
                    {
                        "branch",
                        icon = "",
                        color = { bg = "#292c3c", fg = "#c296eb" },
                    },
                    {
                        "diff",
                        colored = true,
                        symbols = {
                            added = "",
                            modified = "",
                            removed = "",
                        },
                        color = "StatusLine",
                    },
                },
                lualine_c = {
                    {
                        function()
                            return ""
                        end,
                        color = { bg = "#8FCDA9", fg = "#121319" },
                        separator = { left = "", right = "" },
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        sections = {
                            "info",
                            "error",
                            "warn",
                            "hint",
                        },
                        diagnostics_color = {
                            error = { fg = "#820e2d", bg = "#0f111a" },
                            warn = { fg = "DiagnosticWarn", bg = "#0f111a" },
                            info = { fg = "DiagnosticInfo", bg = "#0f111a" },
                            hint = { fg = "#92CDE7", bg = "#0f111a" },
                        },
                        colored = true,
                        update_in_insert = true,
                        always_visible = false,
                        symbols = {
                            error = " ",
                            warn = " ",
                            hint = " ",
                            info = " ",
                        },
                        separator = { left = "", right = "" },
                    },
                },
                lualine_x = { lsp_status },
                lualine_y = {},
                lualine_z = {
                    {
                        "filesize",
                        color = "StatusLine",
                    },
                    {
                        function()
                            return ""
                        end,
                        separator = { left = "", right = "" },
                    },
                    {
                        "progress",
                        color = "StatusLine",
                    },
                    {
                        function()
                            return ""
                        end,
                        separator = { left = "", right = "" },
                    },
                    {
                        "location",
                        color = "StatusLine",
                    },
                    {
                        function()
                            return ""
                        end,
                        separator = { left = "", right = "" },
                    },
                },
            }

            local no_layout = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            }

            require("lualine").setup({
                sections = layout,
                inactive_sections = no_layout,
                options = {
                    icons_enabled = true,
                    globalstatus = false,
                    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
                    always_divide_middle = true,
                    theme = "catppuccin-frappe",
                },
            })
        end,
    },

    {
        "akinsho/bufferline.nvim",
        lazy = false,
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
        config = function(_, opts)
            require("bufferline").setup(opts)

            local group = vim.api.nvim_create_augroup("eugene_bufferline_visibility", { clear = true })
            local function update_tabline()
                vim.o.showtabline = vim.bo.filetype == "dashboard" and 0 or 2
            end

            vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "VimEnter" }, {
                group = group,
                callback = update_tabline,
            })

            update_tabline()
        end,
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
                        "",
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
                        "",
                        "",
                        "",
                        "",
                    },
                    center = {
                        { icon = "S  ", desc = "Restore Session            ", key = "SPC q s", action = "lua require('persistence').load()" },
                        { icon = "O  ", desc = "Recent Files               ", key = "SPC f o", action = "Telescope oldfiles theme=dropdown previewer=false" },
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
