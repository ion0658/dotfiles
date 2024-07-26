return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build   = ":TSUpdate",
        event   = { "InsertEnter" },
        cmd     = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts    = {
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            use_languagetree = true,
            ensure_installed = {}
        },
        config  = true
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        version = false,
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
        },
        event = { "InsertEnter" },
        opts = {
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
        }
    }
}
