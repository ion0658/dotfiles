return {
    {
        "nvim-lualine/lualine.nvim",
        version = false,
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            { 'stevearc/aerial.nvim', lazy = true },
        },
        opts = function()
            -- Color table for highlights
            -- stylua: ignore
            local colors = {
                bg       = '#202328',
                fg       = '#bbc2cf',
                yellow   = '#ECBE7B',
                cyan     = '#008080',
                darkblue = '#081633',
                green    = '#98be65',
                orange   = '#FF8800',
                violet   = '#a9a1e1',
                magenta  = '#c678dd',
                blue     = '#51afef',
                red      = '#ec5f67',
            }

            local opts = {
                extensions = { "aerial", "neo-tree", "lazy" },
                options = {
                    theme = "auto",
                    disabled_filetypes = { "dashboard", "alpha", "ministarter" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        { "branch" },
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { "filename" },
                        { "aerial" },
                    },
                    lualine_c = {
                        { "diagnostics" },
                    },

                    --------------

                    lualine_x = {
                        { "encoding" },
                        { "fileformat" },
                    },
                    lualine_y = {
                        {
                            'diff',
                            -- Is it me or the symbol for modified us really weird
                            symbols = { removed = '', changed = '', added = '' },
                            diff_color = {
                                added = { fg = colors.green },
                                modified = { fg = colors.orange },
                                removed = { fg = colors.red },
                            },
                        },
                        { "progress" },
                        { "location" },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                inactive_sections = {
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
            }
            return opts
        end,
    },
}

