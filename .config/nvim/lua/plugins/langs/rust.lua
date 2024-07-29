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
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "Saecki/crates.nvim",
                event = { "BufReadPost Cargo.toml", "BufWritePost Cargo.toml", "BufNewFile Cargo.toml" },
                opts = {
                    completion = {
                        cmp = { enabled = true },
                    },
                },
            },
        },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, { name = "crates" })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        event = { 'BufReadPost *.rs', 'BufWritePost *.rs', 'BufNewFile *.rs' },
    },
}
