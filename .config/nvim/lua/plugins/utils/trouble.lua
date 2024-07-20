return {
    {
        "folke/trouble.nvim",
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        priority = 9000,
        opts = {
            use_diagnostic_signs = true
        },
    }
}
