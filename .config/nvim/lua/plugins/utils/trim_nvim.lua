return {
    {
        "cappyzawa/trim.nvim",
        version = "*",
        lazy = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            trim_last_line = false,
            patterns = {
                [[%s/\n*\%$/\r/]],
            },
        },
        config = function(_, opts)
            require("trim").setup(opts)
        end,
    }
}

