return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        opts = {
            defaults = {
                initial_mode = 'insert',
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
    { "nvim-telescope/telescope-project.nvim",      lazy = true },
    { 'nvim-telescope/telescope-ui-select.nvim',    lazy = true },
    { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
}
