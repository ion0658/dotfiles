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
        "Saecki/crates.nvim",
        version = false,
        lazy = true,
        event = { "BufReadPost Cargo.toml", "BufWritePost Cargo.toml", "BufNewFile Cargo.toml" },
        opts = {
            completion = {
                cmp = { enabled = true },
            },
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = false,
        lazy = true,
        event = { 'BufReadPost *.rs', 'BufWritePost *.rs', 'BufNewFile *.rs' },
    },
}

