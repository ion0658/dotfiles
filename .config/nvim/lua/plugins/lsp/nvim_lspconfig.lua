return {
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        keys = {
            { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = { "BufReadPre", "BufNewFile", "BufWritePre" },
        opts = {},
        config = function(_, opts)
            require 'lsp_signature'.setup(opts)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
                        return
                    end
                    require("lsp_signature").on_attach({
                        -- ... setup options here ...
                    }, bufnr)
                end,
            })
        end
    }
}
