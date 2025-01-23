local lsp = require("lsp-zero")

local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] Goto definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] Show Hover text" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] Search workspace symbols" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] View diagnostic" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] Goto next diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] Goto prev diagnostic" })

    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] View code action(s)" })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] View references" })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] Rename symbol" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { buffer = bufnr, remap = false, desc = "[[LSP]] Signature Help" })
end

lsp.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
    ensure_installed = { 'rust_analyzer' },
})

require("mason-nvim-dap").setup()

require('lspconfig').lua_ls.setup({
    on_init = function(client)
        -- Fix Undefined global 'vim'
        lsp.nvim_lua_settings(client, {
            settings = {
                Lua = {
                    dignostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })
    end,
})

require('lspconfig').rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true, -- Enable/disable diagnostics
                refreshSupport = false,
            },
        }
    }
})

vim.cmd [[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]]
require('lspconfig').slint_lsp.setup {
    cmd = { 'slint-lsp' },
    filetypes = { 'slint' },
    root_dir = function(fname)
        return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
    end,
    single_file_support = true,
}

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        -- Navigate between completion items
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

        -- Key to confirm selection
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- Key to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Scroll documentation
        ['<C-u'] = cmp.mapping.scroll_docs(-4),
        ['<C-d'] = cmp.mapping.scroll_docs(4)
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})
