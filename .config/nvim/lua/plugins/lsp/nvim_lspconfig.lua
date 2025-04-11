return {
    {
        'neovim/nvim-lspconfig',
        version      = "*",
        lazy         = true,
        dependencies = { 'saghen/blink.cmp', lazy = true },
        event        = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        keys         = {
            { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
        },
    },
}
