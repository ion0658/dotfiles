return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        keys = {
            { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
        }
    },

}
