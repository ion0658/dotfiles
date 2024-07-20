return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        enabled = false,
        opts = {
            flavour = "mocha",
        },
    },
    {
        "sainnhe/sonokai",
        enabled = true,
        priority = 200, -- Very high priority is required
        config = function()
            vim.cmd([[colorscheme sonokai]])
        end
    },
}
