return {
    {
        "sainnhe/sonokai",
        version = "*",
        enabled = true,
        priority = 8000, -- Very high priority is required
        config = function()
            vim.g.sonokai_enable_italic = 1
            vim.g.sonokai_style = "atlantis"
            vim.g.sonokai_better_performance = 1
            vim.g.sonokai_transparent_background = 2
            vim.cmd.colorscheme("sonokai")
        end
    },
    {
        "folke/tokyonight.nvim",
        version = "*",
        enabled = false,
        lazy = false,
        priority = 8000,
        opts = {
            style = "night",
            transparent = true,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end
    },

}
