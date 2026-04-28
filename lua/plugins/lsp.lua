local servers = {
    pyright = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
    clangd = {},
    rust_analyzer = {},
    gopls = {},
}

local function lsp_keymaps(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
end

return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "+ ",
                    package_pending = "> ",
                    package_uninstalled = "- ",
                },
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = vim.tbl_keys(servers),
        },
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "stylua",
                "ruff",
                "clang-format",
                "markdownlint",
                "shfmt",
            },
            auto_update = false,
            run_on_start = true,
        },
    },

    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            appearance = {
                nerd_font_variant = "mono",
            },
            keymap = {
                preset = "none",
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            },
            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
                menu = {
                    border = "rounded",
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = "rounded" },
                },
                ghost_text = { enabled = true },
            },
            signature = {
                enabled = true,
                window = { border = "rounded" },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    snippets = {
                        opts = {
                            search_paths = { vim.fn.stdpath("config") .. "/snippets" },
                            friendly_snippets = true,
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            vim.o.completeopt = "menuone,noselect"
            require("blink.cmp").setup(opts)
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            vim.diagnostic.config({
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                virtual_text = {
                    prefix = "●",
                    source = true,
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("eugene_lsp_attach", { clear = true }),
                callback = lsp_keymaps,
            })

            local ok, blink = pcall(require, "blink.cmp")
            local capabilities = ok and blink.get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

            for name, config in pairs(servers) do
                config.capabilities = capabilities
                vim.lsp.config(name, config)
                vim.lsp.enable(name)
            end
        end,
    },

    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({
                        async = true,
                        timeout_ms = 2000,
                        lsp_format = "fallback",
                    })
                end,
                mode = { "n", "v" },
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_organize_imports", "ruff_format" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                sh = { "shfmt" },
            },
            formatters = {
                clang_format = {
                    prepend_args = { "--style=file" },
                },
            },
        },
        config = function(_, opts)
            local conform = require("conform")
            conform.setup(opts)
            vim.api.nvim_create_user_command("Format", function(args)
                conform.format({
                    bufnr = args.buf,
                    async = true,
                    timeout_ms = 2000,
                    lsp_format = "fallback",
                })
            end, { desc = "Format current buffer" })
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufWritePost", "InsertLeave" },
        keys = {
            {
                "<leader>cl",
                function()
                    require("lint").try_lint()
                end,
                desc = "Lint buffer",
            },
        },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                python = { "ruff" },
                markdown = { "markdownlint" },
            }

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = vim.api.nvim_create_augroup("eugene_lint", { clear = true }),
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },

    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>cx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace diagnostics" },
            { "<leader>cX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
            { "<leader>o", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Document symbols" },
        },
        opts = {},
    },
}
