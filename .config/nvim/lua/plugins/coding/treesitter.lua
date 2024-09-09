return {
    {
        "nvim-treesitter/nvim-treesitter",
        version     = false,
        lazy        = true,
        build       = ":TSUpdate",
        event       = { "VeryLazy" },
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
        version = false,
        lazy = true,
        event = { "VeryLazy" },

    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        version = false,
        lazy    = true,
        event   = { "VeryLazy" },
    }
}
