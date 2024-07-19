return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-telescope/telescope-ui-select.nvim',
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        event = { "VeryLazy" },
        cmd = "Telescope",
        opts = {
            defaults = {
                initial_mode = 'insert',
                layout_config = {
                    vertical = {
                        width = 0.5,
                        mirror = true,
                        prompt_position = 'top'
                    }
                },
                file_ignore_patterns = {
                    "^node_modules/",
                    "^.git/",
                    "^.cache/",
                    "^.idea/",
                    "^.vscode/",
                    "^.DS_Store",
                    "^.gitignore",
                    "^.gitmodules",
                    "^.gitattributes",
                    "^.gitkeep",
                    "^.gitlab",
                    "^.github",
                    "^target/"
                }
            },
            extensions = {
                project = {
                    theme = 'dropdown',
                },
                aerial = {
                    show_nesting = {
                        ['_'] = false,
                        json = true,
                        yaml = true
                    },
                    show_columns = 'both'
                },
            }

        },
        config = function(_, opts)
            require('aerial').setup()
            local p = require("telescope")
            p.setup(opts)
            p.load_extension("ui-select")
            p.load_extension("file_browser")
            p.load_extension("project")
            p.load_extension("aerial")
        end,
        keys = {
            {
                "<leader>ff",
                "<cmd>Telescope find_files<cr>",
                desc = "Find Files",
            },
            {
                "<leader>fg",
                "<cmd>Telescope live_grep<cr>",
                desc = "Live Grep",
            },
            {
                "<leader>fb",
                "<cmd>Telescope buffers<cr>",
                desc = "Buffers",
            },
            {
                "<leader>fh",
                "<cmd>Telescope help_tags<cr>",
                desc = "Help Tags",
            },
            {
                "<leader>fs",
                "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
                desc = "File Browser",
            },
            {
                "<leader>fa",
                "<cmd>Telescope aerial<cr>",
                desc = "Goto Symbol (Aerial)",
            },
            {
                "<leader>fp",
                "<cmd>Telescope project<cr>",
                desc = "Project",
            }
        },
    }
}
