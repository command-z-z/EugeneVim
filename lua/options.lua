-- vim personal config start------
vim.opt.encoding = "utf-8"
-- ban mouse
vim.opt.mouse = "c"
-- display relative line number
vim.opt.relativenumber = true
-- display line number
vim.opt.number = true
-- tab equal four tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- highlight line where is cursor
vim.opt.cursorline = true
-- set
vim.opt.wrap = true
-- set type key
vim.opt.showcmd = true
-- 
vim.opt.wildmenu = true
-- no need back file
vim.opt.backup = false
-- highlight search
vim.opt.hlsearch = true
-- defx icon 
vim.g.defx_icons_column_length = 2

vim.opt.clipboard = "unnamedplus"

-- fold
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- copilot
vim.g.plenary_curl_bin_path = "/usr/bin/curl"
