return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            local ensure_installed = {
                "rust",
                "ron"
            }
            for _, lang in pairs(ensure_installed) do
                table.insert(opts.ensure_installed, lang)
            end
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "Saecki/crates.nvim",
                event = { "BufRead Cargo.toml" },
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
