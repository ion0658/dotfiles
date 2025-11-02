return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "jsdoc",
                "json",
                "jsonc",
                "toml",
                "xml",
                "yaml",
                "dockerfile"
            }
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- json
                "jsonls",
                -- docker
                "dockerls",
                "docker_compose_language_service",
                -- markdown
                "marksman",
                -- yaml
                "yamlls",
                -- toml
                "taplo"
            }
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
    },
}

