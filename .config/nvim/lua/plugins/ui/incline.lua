return {
    {
        'b0o/incline.nvim',
        config = function()
            vim.o.laststatus = 3
            require('incline').setup()
        end,
        -- Optional: Lazy load Incline
        event = 'VeryLazy',
    },
}
