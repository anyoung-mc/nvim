local wk = require("which-key")

wk.add({
    { "<leader>a", desc = "Mark File",   mode = "n" },
    { "<leader>d", desc = "Void delete", mode = "n" },
    { "<leader>f", desc = "Format File", mode = "n" },
    {
        { "<leader>pf", desc = "Find File",           mode = "n" },
        { "<leader>ps", desc = "Search in File",      mode = "n" },
        { "<leader>pv", desc = "Return to File Tree", mode = "n" },
    },
    { "<leader>k", desc = "Next Loc List Item",    mode = "n" },
    { "<leader>j", desc = "Prev Loc List Item",    mode = "n" },
    { "<leader>s", desc = "Replace Selected With", mode = "n" },
    { "<leader>u", desc = "Undotree",              mode = "n" },
    { "<leader>x", desc = "Mark file Executable",  mode = "n" },
    { "<leader>y", desc = "Yank System",           mode = { "n", "v" } },
    { "<leader>Y", desc = "Yank System",           mode = "n" },
    { "<leader>?", desc = "Buffer Local keymaps",  mode = "n" },
    {
        { "gd",          desc = "Goto definition",     mode = "n" },
        { "K",           desc = "Show Language Hints", mode = "n" },
        { "<leader>l",   group = "view" },
        { "<leader>vws", desc = "Workspace Symbols",   mode = "n" },
        { "<leader>vd", desc = "Diagnostics",   mode = "n" },
    }
})
