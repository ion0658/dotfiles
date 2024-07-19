return {

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "stevearc/aerial.nvim",
        },
        event = "VeryLazy",
        opts = function()
            local icons = require("nvim-web-devicons").get_icons()
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
                        { "diagnostics", },
                    },

                    --------------

                    lualine_x = {
                        { "encoding" },
                        { "fileformat" },
                    },
                    lualine_y = {
                        {
                            "diff",
                            symbols = {
                                added = icons.git.added,
                                modified = icons.git.modified,
                                removed = icons.git.removed,
                            },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
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
