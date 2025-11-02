return {
    {
        "folke/trouble.nvim",
        version = "*",
        lazy = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            use_diagnostic_signs = true
        },
    }
}

