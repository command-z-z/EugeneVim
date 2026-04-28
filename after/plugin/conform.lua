local status, conform = pcall(require, "conform")
if not status then
    return
end

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        c = { "clang_format" },
        cpp = { "clang_format" },
    },
    formatters = {
        ["clang_format"] = {
            prepend_args = { "--style=file" },
        },
    },
})

vim.api.nvim_create_user_command("Format", function(args)
    conform.format({
        bufnr = args.buf,
        async = true,
        timeout_ms = 2000,
        lsp_format = "fallback",
    })
end, { desc = "Format current buffer" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    conform.format({
        async = true,
        timeout_ms = 2000,
        lsp_format = "fallback",
    })
end, { silent = true, desc = "Format buffer" })
