return {
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        optional = true,
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
        event = { "VeryLazy" },
        opts = {
            ensure_installed = {}
        },
        config = function(_, opts)
            require("mason").setup()
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
        event = { "VeryLazy" },
        opts = {
            ensure_installed = {}
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-null-ls").setup(opts)
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        event = { "VeryLazy" },
        opts = {
            ensure_installed = {}
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-nvim-dap").setup(opts)
        end,
    }
}
