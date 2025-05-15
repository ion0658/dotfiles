local ensure_installed = {
    -- web
    "ts_ls",
    -- "biome",
    "volar",
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
    },
    {
        "norcalli/nvim-colorizer.lua",
        version = false,
        lazy = true,
        event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    },
}
