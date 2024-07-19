local map = vim.keymap.set

-- JJ to normal mode
map("i", "jj", "<Esc>", { desc = "To Normal Mode" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

map({ "n", "v" }, "<leader>cf", function()
    vim.lsp.buf.format()
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })


-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Toggle Terminal
map("n", "<leader>ft", "<Cmd>ToggleTerm<CR>", { desc = "Terminal (Root Dir)" })
map("n", "<c-/>", "<Cmd>ToggleTerm<CR>", { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", "<Cmd>ToggleTerm<CR>", { desc = "which_key_ignore" })
-- Terminal Mappings
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<c-w>d", "<C-W>c", { desc = "Delete Window", remap = true })


vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local function lsp(desc)
            if desc then
                desc = "LSP: " .. desc
            end
            return { desc = desc, buffer = ev.buf }
        end
        -- { "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto Definition", has = "definition" },
        map("n", "gd", vim.lsp.buf.definition, lsp("Goto Definition"))
        -- { "gr",         vim.lsp.buf.references,      desc = "References",            nowait = true },
        map("n", "gr", vim.lsp.buf.references, lsp("References"))
        -- { "gI",         vim.lsp.buf.implementation,  desc = "Goto Implementation" },
        map("n", "gI", vim.lsp.buf.implementation, lsp("Goto Implementation"))
        -- { "gy",         vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
        map("n", "gy", vim.lsp.buf.type_definition, lsp("Goto Type Definition"))
        -- { "gD",         vim.lsp.buf.declaration,     desc = "Goto Declaration" },
        map("n", "gD", vim.lsp.buf.declaration, lsp("Goto Declaration"))
        -- { "K",          vim.lsp.buf.hover,           desc = "Hover" },
        map("n", "K", vim.lsp.buf.hover, lsp("Hover"))
        -- { "gK",         vim.lsp.buf.signature_help,  desc = "Signature Help",        has = "signatureHelp" },
        map("n", "gK", vim.lsp.buf.signature_help, lsp("Signature Help"))
        -- { "<c-k>",      vim.lsp.buf.signature_help,  mode = "i",                     desc = "Signature Help", has = "signatureHelp" },
        map("i", "<c-k>", vim.lsp.buf.signature_help, lsp("Signature Help"))
    end,
})
