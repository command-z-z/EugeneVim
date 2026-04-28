local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

vim.opt.termguicolors = true
bufferline.setup({
	options = {
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 15,
		max_prefix_length = 12, -- prefix used when a buffer is de-duplicated
		tab_size = 15,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "defx",
				text = "Defx File Explorer",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})

--按键映射
vim.keymap.set("n", "gb", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true, desc = "Pick bufferline buffer" })

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", {
		noremap = true,
		silent = true,
		desc = "Go to buffer " .. i,
	})
end
