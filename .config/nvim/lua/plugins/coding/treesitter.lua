return {
    {
        "nvim-treesitter/nvim-treesitter",
        version      = false,
        build        = ":TSUpdate",
        event        = { "VeryLazy" },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
        cmd          = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts         = {
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
            }
        },
        config       = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        version = false,
        optional = true,
        lazy = true
    }
}
