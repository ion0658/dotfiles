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
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "ts_ls",
                "vue_ls",
                "tailwindcss",
            }
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
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

