local ensure_installed = {
    -- web
    "html",
    "cssls",
    "biome",
    "volar",
    "tsserver",
    "tailwindcss",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "html",
                "css",
                "javascript",
                "tsx",
                "typescript",
                "vue",
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
}
