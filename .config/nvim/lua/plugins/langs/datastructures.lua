local ensure_installed = {
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
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
}
