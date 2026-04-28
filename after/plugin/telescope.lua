local status, actions = pcall(require, "telescope.actions")
if not status then
	return
end

local fb_actions = require("telescope").extensions.file_browser.actions
require("telescope").setup({
	defaults = {
		-- prompt_prefix = '🔭 ',
		prompt_prefix = "🔎 ",
		selection_caret = " ",
		mappings = {
			n = {
				["q"] = actions.close,
				["l"] = actions.file_edit,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		file_browser = {
			theme = "dropdown",
			previewer = false, -- override the file sorter
			grouped = true,
			git_status = false,
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					["T"] = fb_actions.create,
					["a"] = fb_actions.rename,
					["dD"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["h"] = fb_actions.goto_parent_dir,
					["l"] = actions.select_default,
					["yy"] = fb_actions.copy,
					["dd"] = fb_actions.move,
					["gh"] = fb_actions.goto_home_dir,
					["vv"] = fb_actions.select_all,
					["backspace"] = fb_actions.toggle_hidden,
					-- your custom normal mode mappings
				},
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			hidden = true,
			follow = true,
		},
		oldfiles = {
			theme = "dropdown",
			previewer = false,
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			sort_mru = true,
			ignore_current_buffer = true,
		},
		live_grep = {
			layout_strategy = "horizontal",
			layout_config = {
				width = 0.9,
				height = 0.85,
				preview_width = 0.55,
			},
		},
	},
})

-- To get fzf loaed and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

--按键设置
vim.api.nvim_set_keymap("n", "<leader>ff", [[<cmd>Telescope find_files<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>Telescope live_grep<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fh", [[<cmd>Telescope help_tags<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fo", [[<cmd>Telescope oldfiles<cr>]], {})
vim.api.nvim_set_keymap("n", "<leader>fb", [[<cmd>Telescope file_browser<cr>]], {})
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { silent = true, desc = "Pick buffer" })

local function current_buffer_dir()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		return vim.loop.cwd()
	end
	return vim.fn.fnamemodify(path, ":p:h")
end

vim.keymap.set("n", "<leader>fB", function()
	require("telescope").extensions.file_browser.file_browser({
		cwd = current_buffer_dir(),
		path = current_buffer_dir(),
	})
end, { silent = true, desc = "File browser from buffer dir" })

vim.keymap.set("n", "<leader>fF", function()
	require("telescope.builtin").find_files({
		cwd = current_buffer_dir(),
	})
end, { silent = true, desc = "Find files from buffer dir" })

vim.keymap.set("n", "<leader>fG", function()
	require("telescope.builtin").live_grep({
		cwd = current_buffer_dir(),
	})
end, { silent = true, desc = "Live grep from buffer dir" })
