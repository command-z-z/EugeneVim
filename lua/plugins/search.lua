local function current_buffer_dir()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        return vim.uv.cwd()
    end
    return vim.fn.fnamemodify(path, ":p:h")
end

return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-telescope/telescope-file-browser.nvim",
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help" },
            { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find old files" },
            { "<leader>fb", "<cmd>Telescope file_browser<CR>", desc = "File browser" },
            { "<leader>bb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
            {
                "<leader>fB",
                function()
                    require("telescope").extensions.file_browser.file_browser({
                        cwd = current_buffer_dir(),
                        path = current_buffer_dir(),
                        select_buffer = true,
                    })
                end,
                desc = "File browser from buffer dir",
            },
            {
                "<leader>fF",
                function()
                    require("telescope.builtin").find_files({ cwd = current_buffer_dir() })
                end,
                desc = "Find files from buffer dir",
            },
            {
                "<leader>fG",
                function()
                    require("telescope.builtin").live_grep({ cwd = current_buffer_dir() })
                end,
                desc = "Live grep from buffer dir",
            },
        },
        config = function()
            local actions = require("telescope.actions")
            local fb_actions = require("telescope").extensions.file_browser.actions

            require("telescope").setup({
                defaults = {
                    prompt_prefix = "🔎 ",
                    selection_caret = " ",
                    mappings = {
                        n = {
                            q = actions.close,
                            l = actions.file_edit,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    file_browser = {
                        theme = "dropdown",
                        previewer = false,
                        layout_config = {
                            width = 0.85,
                            height = 0.75,
                        },
                        grouped = true,
                        git_status = false,
                        hide_parent_dir = true,
                        hijack_netrw = true,
                        mappings = {
                            n = {
                                T = fb_actions.create,
                                a = fb_actions.rename,
                                dD = fb_actions.remove,
                                o = fb_actions.open,
                                h = fb_actions.goto_parent_dir,
                                l = actions.select_default,
                                yy = fb_actions.copy,
                                dd = fb_actions.move,
                                gh = fb_actions.goto_home_dir,
                                vv = fb_actions.select_all,
                                backspace = fb_actions.toggle_hidden,
                            },
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                        hidden = true,
                        follow = true,
                    },
                    oldfiles = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                        sort_mru = true,
                        ignore_current_buffer = true,
                    },
                    live_grep = {
                        layout_strategy = "horizontal",
                        layout_config = {
                            width = 0.9,
                            height = 0.85,
                            preview_width = 0.55,
                        },
                    },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
        end,
    },

    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODO comments" },
        },
        opts = {},
    },
}
