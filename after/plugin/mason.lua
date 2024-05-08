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
    ensure_installed = { "pyright", "clangd", "lua_ls" },
})

-- enable to install specified debug dap
local statue__, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not statue__ then
    return
end

mason_nvim_dap.setup({
    ensure_installed = { "python", "cppdbg" }
})

-- enable to install specified formatter and Linter
local mason_registry = require("mason-registry")
Formatter_list = {
    "black",
    "isort",
    "docformatter",
}
Linter_list = {
    "flake8",
    "codespell",
}

local ensure_installed = function()
    for _, name in pairs(Formatter_list) do
        if not mason_registry.is_installed(name) then
            local package = mason_registry.get_package(name)
            package:install()
        end
    end
    for _, name in pairs(Linter_list) do
        if not mason_registry.is_installed(name) then
            local package = mason_registry.get_package(name)
            package:install()
        end
    end
end

mason_registry.refresh(vim.schedule_wrap(ensure_installed))
