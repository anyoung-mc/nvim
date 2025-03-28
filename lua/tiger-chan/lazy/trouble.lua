return {
    {
        "folke/trouble.nvim",
        keymap = {
            { "<leader>tt", function() require("trouble").toggle() end,                                      desc = "Toggle Trouble", mode = "n" },
            { "[t",         function() require("trouble").next({ skip_groups = true, jump = true }) end,     desc = "Next - Trouble", mode = "n" },
            { "]t",         function() require("trouble").previous({ skip_groups = true, jump = true }) end, desc = "Prev - Trouble", mode = "n" },
        },
        config = function()
            require("trouble").setup({ icons = false, })
        end
    },
}
