return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "objc"
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",
            }
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = {
                "clang-format",
                "cmake-language-server"
            }
        }
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
    },
    {
        "p00f/clangd_extensions.nvim",
        version = "*",
        lazy = true,
        event = {
            'BufReadPost *.c',
            'BufReadPost *.cpp',
            'BufReadPost *.m',
            'BufReadPost *.mm',
            'BufReadPost *.h',
            'BufReadPost *.hpp',
            'BufWritePost *.c',
            'BufWritePost *.cpp',
            'BufWritePost *.m',
            'BufWritePost *.mm',
            'BufWritePost *.h',
            'BufWritePost *.hpp',
            'BufNewFile *.c',
            'BufNewFile *.cpp',
            'BufNewFile *.m',
            'BufNewFile *.mm',
            'BufNewFile *.h',
            'BufNewFile *.hpp',
        },
        opts = {
            inlay_hints = {
                inline = true,
            },
            ast = {
                --These require codicons (https://github.com/microsoft/vscode-codicons)
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    specifier = "",
                    statement = "",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                },
            },
        },
    },
}
