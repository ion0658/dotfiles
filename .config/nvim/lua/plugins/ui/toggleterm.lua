return {
    {
        'akinsho/toggleterm.nvim',
        cmd = 'ToggleTerm',
        opts = function()
            return { start_in_insert = true }
        end,
        keys = {
            { "<leader>tt", "<CMD>ToggleTerm<CR>", desc = "ToggleTerm" }
        }
    },
}
