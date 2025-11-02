return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        lazy = true,
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "stevearc/aerial.nvim",
        },
        opts = {
            defaults = {
                initial_mode = 'insert',
                file_ignore_patterns = {
                    "^node_modules/*",
                    "^.git/*",
                    "^.cache/*",
                    "^.idea/*",
                    "^.DS_Store",
                    "^.gitignore",
                    "^.gitmodules",
                    "^.gitattributes",
                    "^.gitkeep",
                    "^target/*"
                },
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
            extensions = {
                aerial = {
                    show_nesting = {
                        ['_'] = false,
                        json = true,
                        yaml = true
                    },
                    show_columns = 'both',
                },
                file_browser = {
                    hidden = true,
                    respect_gitignore = false,
                },
            }
        },
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
            },
            {
                "<leader>fS",
                "<cmd>Telescope session-lens search_session<cr>",
                desc = "Search Session"
            }
        },
        config = function(_, opts)
            require("aerial").setup()
            require("telescope").setup(opts)
        end
    },
    {
        "nvim-telescope/telescope-project.nvim",
        version = "*",
        lazy = true
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        version = "*",
        lazy = true
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        version = "*",
        lazy = true,
    },
}
