return {
    {
        'akinsho/toggleterm.nvim',
        cmd = 'ToggleTerm',
        opts = {
            start_in_insert = true,
            direction = 'float',
        }
        ,
        keys = {
            { "<leader>tt", "<CMD>ToggleTerm<CR>", desc = "ToggleTerm" }
        }
    },
}
