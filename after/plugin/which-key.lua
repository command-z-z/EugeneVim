local status, which_key = pcall(require, "which-key")
if not status then
    return
end

which_key.setup({
    preset = "modern",
    delay = 500,
})

which_key.add({
    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>c", group = "code" },
    { "<leader>b", group = "buffer" },
    { "<leader>e", group = "edit" },
    { "<leader>s", group = "search" },
})
