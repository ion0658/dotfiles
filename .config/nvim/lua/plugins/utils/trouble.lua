return {
    {
        "folke/trouble.nvim",
        version = false,
        lazy = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            use_diagnostic_signs = true
        },
    }
}
