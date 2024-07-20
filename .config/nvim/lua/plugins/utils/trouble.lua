return {
    {
        "folke/trouble.nvim",
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            use_diagnostic_signs = true
        },
    }
}
