return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "InsertEnter" },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            use_languagetree = true,
            ensure_installed = {}
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
