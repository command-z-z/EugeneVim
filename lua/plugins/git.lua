return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "|" },
                change = { text = "|" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signs_staged_enable = true,
            signcolumn = true,
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 1000,
                ignore_whitespace = false,
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local function map(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
                end

                map("<leader>gp", gs.preview_hunk, "Preview hunk")
                map("<leader>gr", gs.reset_hunk, "Reset hunk")
                map("<leader>gb", function()
                    gs.blame_line({ full = true })
                end, "Blame line")
                map("<leader>gf", gs.diffthis, "Diff current file")
                map("<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
                map("<leader>gL", gs.toggle_deleted, "Toggle deleted lines")
            end,
        },
    },

    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewFileHistory",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open git diff view" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Current file git history" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Repository git history" },
            { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close git diff view" },
        },
        opts = {
            enhanced_diff_hl = true,
            view = {
                default = { layout = "diff2_horizontal" },
                file_history = { layout = "diff2_horizontal" },
            },
        },
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        cmd = "ToggleTerm",
        keys = {
            { "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle floating terminal" },
            {
                "<leader>gg",
                function()
                    local Terminal = require("toggleterm.terminal").Terminal
                    local lazygit = Terminal:new({
                        cmd = "lazygit",
                        hidden = true,
                        direction = "float",
                        float_opts = {
                            border = "single",
                            width = function()
                                return math.floor(vim.o.columns * 0.9)
                            end,
                            height = function()
                                return math.floor(vim.o.lines * 0.9)
                            end,
                        },
                    })
                    lazygit:toggle()
                end,
                desc = "Toggle lazygit",
            },
        },
        opts = {
            size = 18,
            open_mapping = [[<C-\>]],
            hide_numbers = true,
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = "float",
            float_opts = {
                border = "single",
                width = function()
                    return math.floor(vim.o.columns * 0.85)
                end,
                height = function()
                    return math.floor(vim.o.lines * 0.8)
                end,
            },
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)
            vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true, desc = "Exit terminal mode" })
        end,
    },
}
