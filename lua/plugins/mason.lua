return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({})

        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "rust_analyzer",
                "lua_ls",
                "omnisharp",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "ruff",
                "stylua",
                "prettier",
            },
        })
    end,
}
