return {
    {
        "sainnhe/sonokai",
        enabled = true,
        priority = 8000, -- Very high priority is required
        config = function()
            vim.g.sonokai_enable_italic = true
            vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_better_performance = true
            vim.g.sonokai_transparent_background = 2
            vim.cmd.colorscheme("sonokai")
        end
    },
}

