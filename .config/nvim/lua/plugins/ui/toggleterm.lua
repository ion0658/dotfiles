return {
    {
        'akinsho/toggleterm.nvim',
        version = false,
        lazy = true,
        cmd = 'ToggleTerm',
        opts = {
            start_in_insert = true,
            direction = 'float',
        },
        keys = {
            { "<leader>tt", "<CMD>ToggleTerm<CR>", desc = "ToggleTerm" }
        },
        config = function(_, opts)
            if vim.loop.os_uname().sysname == 'Windows_NT' then
                opts.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
            end
            require('toggleterm').setup(opts)
        end
    },
}
