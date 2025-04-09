local ensure_installed = {
    "rust_analyzer",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "rust",
                "ron",
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
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "Saecki/crates.nvim",
        version = "*",
        lazy = true,
        event = { "BufReadPost Cargo.toml", "BufWritePost Cargo.toml", "BufNewFile Cargo.toml" },
        opts = {
            completion = {
                cmp = { enabled = true },
            },
        },
    },
}
