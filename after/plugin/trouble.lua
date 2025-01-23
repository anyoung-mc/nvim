vim.keymap.set("n", "<leader>xq", "<cmd>Trouble diagnostics toggle<cr>",
    { silent = true, noremap = true, desc = "Toggle Trouble" }
)

local open_with_trouble = require('trouble.sources.telescope').open
-- Use this to add more results to trouble without clearing the list
-- local add_to_trouble = require('trouble.sources.telescope').add

require('telescope').setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
        }
    }
})
