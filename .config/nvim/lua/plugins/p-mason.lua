load('mason.nvim')
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    }
})

load('mason-lspconfig.nvim')
require("mason-lspconfig").setup({
    ensure_installed = {
        'lua_ls'
    },
    automatic_installation = true,
})
