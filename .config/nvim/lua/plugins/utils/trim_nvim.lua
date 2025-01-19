return {
    {
        "cappyzawa/trim.nvim",
        version = false,
        lazy = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            trim_last_line = false,
            patterns = {
                [[%s/\n*\%$/\r/]],
            },
        }
    }
}

