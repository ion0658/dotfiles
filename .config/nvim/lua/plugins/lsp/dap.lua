return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        version     = false,
        event       = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        opts_extend = { "ensure_installed" },
        opts        = {
            ensure_installed = {}
        },
    }
}
