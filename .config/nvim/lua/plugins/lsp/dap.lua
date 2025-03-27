return {
    {
        "mfussenegger/nvim-dap",
        version = "*",
        lazy = true,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        version      = "*",
        lazy         = true,
        event        = { 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        dependencies = {
            { 'rcarriga/nvim-notify', lazy = true }
        },
        opts_extend  = { "ensure_installed" },
        opts         = {
            ensure_installed = {
                "codelldb"
            }
        },
    }
}
