return {
    {
        "sainnhe/sonokai",
        enabled = true,
        priority = 8000, -- Very high priority is required
        config = function()
            vim.cmd([[colorscheme sonokai]])
        end
    },
}

