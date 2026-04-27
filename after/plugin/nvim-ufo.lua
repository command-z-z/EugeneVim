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

vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
vim.keymap.set('n', 'zp', function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
        vim.notify('No folded lines under cursor', vim.log.levels.INFO)
    end
end, { desc = 'Peek folded lines' })
