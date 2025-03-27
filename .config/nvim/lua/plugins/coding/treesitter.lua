return {
    {
        "nvim-treesitter/nvim-treesitter",
        version     = "*",
        lazy        = true,
        build       = ":TSUpdate",
        event       = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        cmd         = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts_extend = { "ensure_installed" },
        opts        = {
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            use_languagetree = true,
            ensure_installed = {},
            auto_install = true,
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                        ["]a"] = "@parameter.inner",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]C"] = "@class.outer",
                        ["]A"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                        ["[a"] = "@parameter.inner",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[C"] = "@class.outer",
                        ["[A"] = "@parameter.inner",
                    },
                }
            },
        },
        config      = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        version = "*",
        lazy    = true,
        event   = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        version = "*",
        lazy    = true,
        event   = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    }
}
