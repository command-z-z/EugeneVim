local statue, guard = pcall(require, "guard")
if not statue then
    return
end

local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('python'):fmt('black')
    :append('isort')
    :append('docformatter')
    :lint('flake8')

ft('lua'):fmt('lsp')

ft('*'):lint('codespell')

-- Call setup() LAST!
require('guard').setup({
    -- Choose to format on every write to a buffer
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
    -- By default, Guard writes the buffer on every format
    -- You can disable this by setting:
    -- save_on_fmt = false,
})

vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>GuardFmt<CR>", { silent = true, noremap = true })
