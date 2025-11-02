return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        lazy = true,
        cmd = 'ToggleTerm',
        opts = {
            start_in_insert = true,
            direction = 'vertical',
            size = 120,
            persist_size = true,
        },
        keys = {
            { "<leader>tt", "<CMD>ToggleTerm<CR>", desc = "ToggleTerm" }
        },
        config = function(_, opts)
            if vim.loop.os_uname().sysname == 'Windows_NT' then
                opts.shell = vim.fn.executable "nu" == 1 and "nu" or
                    (vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell")
            end
            require('toggleterm').setup(opts)
        end
    },
}

