local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
  return
end

local languages = {
  "cpp",
  "c",
  "python",
  "lua",
  "rust",
  "go",
  "vim",
  "markdown",
  "markdown_inline",
  "regex",
  "bash",
}

treesitter.setup {
  install_dir = vim.fn.stdpath("data") .. "/site",
}

treesitter.install(languages)

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "c",
    "cpp",
    "python",
    "lua",
    "rust",
    "go",
    "vim",
    "markdown",
    "sh",
  },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
