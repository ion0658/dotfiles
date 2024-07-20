return {
    {
        "williamboman/mason.nvim",
        optional = true,
        lazy = true,
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
        event = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        priority = 100,
        opts = {
            ensure_installed = {},
        },
        config = function(_, opts)
            local p = require("mason-lspconfig")
            p.setup(opts)
            p.setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end
            }
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        event = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        priority = 101,
        opts = {
            ensure_installed = {}
        },
        config = true
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        event = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        priority = 102,
        opts = {
            ensure_installed = {}
        },
        config = true
    }
}
