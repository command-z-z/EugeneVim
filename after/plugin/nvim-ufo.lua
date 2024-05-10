local status, ufo = pcall(require, "ufo")
if (not status) then
    return
end

-- Option 3: treesitter as a main provider instead
-- (Note: the `nvim-treesitter` plugin is *not* needed.)
-- ufo uses the same query files for folding (queries/<lang>/folds.scm)
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end
})

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "zR", ":lua require('ufo').openAllFolds", opts)
vim.api.nvim_set_keymap("n", "zM", ":lua require('ufo').closeAllFolds", opts)
