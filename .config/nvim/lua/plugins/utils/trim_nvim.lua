return {
    {
        "cappyzawa/trim.nvim",
        version = "*",
        lazy = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {}
    }
}
