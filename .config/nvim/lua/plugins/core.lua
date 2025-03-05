return {
    { "nvim-tree/nvim-web-devicons", version = false, lazy = true },
    { "nvim-lua/plenary.nvim",       version = false, lazy = true },
    { 'echasnovski/mini.icons',      version = false, lazy = true },
    {
        "vhyrro/luarocks.nvim",
        version = false,
        priority = 9000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    }
}
