local ok, blink = pcall(require, "blink.cmp")
if not ok then
    return
end

vim.o.completeopt = "menuone,noselect"

blink.setup({
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
            draw = {
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind" },
                    { "source_name" },
                },
                components = {
                    kind = {
                        ellipsis = false,
                        width = { max = 20 },
                        text = function(ctx)
                            return ctx.kind_icon .. " " .. ctx.kind
                        end,
                        highlight = function(ctx)
                            return ctx.kind_hl
                        end,
                    },
                    source_name = {
                        width = { max = 10 },
                        text = function(ctx)
                            return "[" .. ctx.source_name .. "]"
                        end,
                        highlight = "BlinkCmpSource",
                    },
                },
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            window = {
                border = "rounded",
            },
        },
        ghost_text = {
            enabled = true,
        },
    },
    signature = {
        enabled = true,
        window = {
            border = "rounded",
        },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
            lsp = {
                name = "LSP",
            },
            path = {
                name = "Path",
            },
            snippets = {
                name = "Snip",
                opts = {
                    search_paths = { vim.fn.stdpath("config") .. "/snippets" },
                    friendly_snippets = true,
                },
            },
            buffer = {
                name = "Buffer",
            },
        },
    },
})
