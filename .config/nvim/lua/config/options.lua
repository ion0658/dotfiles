vim.opt.number = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.encoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.wrapscan = true
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.pumblend = 10
-- netrw (デフォルトのファイラー) を無効化
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }

-- disable perl provider
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.diagnostic.config {
    virtual_text = false,
    float = { border = "rounded" },
}

-- Cursor Position Restore on File Open
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
    end,
})

-- windowの20%をscrolloffに設定
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "WinEnter" }, {
    group = vim.api.nvim_create_augroup("UserNvimConfig", {}),
    callback = function()
        vim.opt.scrolloff = math.floor(vim.o.lines * 0.2)
    end,
})
