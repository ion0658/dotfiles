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
        opts = {
            ensure_installed = {},
        },
        config = function(_, opts)
            local p = require("mason-lspconfig")
            p.setup(opts)
            p.setup_handlers {
                function(server_name)
                    local server_config = {}
                    if server_name == "volar" then
                        server_config.filetypes = { 'vue', 'typescript', 'javascript' }
                    end
                    require("lspconfig")[server_name].setup(server_config)
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
        opts = {
            ensure_installed = {}
        },
        config = true
    }
}
