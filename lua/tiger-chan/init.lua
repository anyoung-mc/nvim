require("tiger-chan.remap")
require("tiger-chan.set")
require("tiger-chan.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local TigerChanGroup = augroup('TigerChan', {})

autocmd('BufEnter', {
    group = TigerChanGroup,
    callback = function()
        vim.cmd.colorscheme("adwaita")
        -- vim.cmd.colorscheme("rose-pine-moon")
    end
})

autocmd('LspAttach', {
    group = TigerChanGroup,
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] Goto definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] Show Hover text" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] Search workspace symbols" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] View diagnostic" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] Goto next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] Goto prev diagnostic" })

        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] View code action(s)" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] View references" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] Rename symbol" })
        vim.keymap.set("i", "<A-k>", function() vim.lsp.buf.signature_help() end,
            { buffer = e.buf, remap = false, desc = "[[LSP]] Signature Help" })
    end
})

vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
