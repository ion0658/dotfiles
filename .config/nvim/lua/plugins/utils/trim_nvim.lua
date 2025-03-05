return {
    {
        "cappyzawa/trim.nvim",
        version = false,
        lazy = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {}
    }
}
