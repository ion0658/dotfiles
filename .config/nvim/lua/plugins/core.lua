return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "nvim-lua/plenary.nvim",       lazy = true },
    { 'echasnovski/mini.icons',      version = false, lazy = true },
    {
        "vhyrro/luarocks.nvim",
        priority = 9000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    }
}
