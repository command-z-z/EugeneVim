local status, lint = pcall(require, "lint")
if not status then
    return
end

lint.linters_by_ft = {
    python = { "ruff" },
    markdown = { "markdownlint" },
}

local lint_group = vim.api.nvim_create_augroup("nvim_lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_group,
    callback = function()
        lint.try_lint()
    end,
})

vim.keymap.set("n", "<leader>cl", function()
    lint.try_lint()
end, { silent = true, desc = "Lint buffer" })
