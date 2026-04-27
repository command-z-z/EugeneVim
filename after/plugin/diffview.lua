local status, diffview = pcall(require, "diffview")
if not status then
    return
end

diffview.setup({
    enhanced_diff_hl = true,
    view = {
        default = {
            layout = "diff2_horizontal",
        },
        file_history = {
            layout = "diff2_horizontal",
        },
    },
})

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { silent = true, desc = "Open git diff view" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { silent = true, desc = "Current file git history" })
vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", { silent = true, desc = "Repository git history" })
vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { silent = true, desc = "Close git diff view" })
