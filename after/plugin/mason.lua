local statue, mason = pcall(require, "mason")
if not statue then
    return
end

mason.setup({
    automatic_installation = true,

    ui = {
        icons = {
            package_installed = " ",
            package_pending = " ",
            package_uninstalled = " ﮊ",
        },
    },
})

-- enable to install specified lsp
local statue_, mason_lspconfig = pcall(require, "mason-lspconfig")
if not statue_ then
    return
end

mason_lspconfig.setup({
    ensure_installed = { "pyright", "lua_ls" },
})

local tools_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not tools_ok then
    return
end

mason_tool_installer.setup({
    ensure_installed = {
        "stylua",
        "ruff",
        "clang-format",
        "markdownlint",
    },
    auto_update = false,
    run_on_start = true,
})
