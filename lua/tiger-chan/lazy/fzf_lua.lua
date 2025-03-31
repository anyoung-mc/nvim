return {
    "ibhagwan/fzf-lua",
    keys = {
        { "<leader>pf", function() require("fzf-lua").files() end,     desc = "Find files",     mode = "n" },
        { "<C-p>",      function() require("fzf-lua").git_files() end, desc = "Find GIT files", mode = "n" },
        { "<leader>pg", function() require("fzf-lua").live_grep() end, desc = "Grep in files",  mode = "n" },
        {
            "<leader>ps",
            function()
                require("fzf-lua").grep({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Grep in files",
            mode = "n"
        },
    },
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
        winopts = {
            preview = {
                layout = "vertical",
                flip_columns = 5000,
                vertical = "down",
                horizontal = "down",
            }
        },
        keymap = {
            fzf = {
                ["ctrl-q"] = "select-all+accept",
            },
        },
    }
}
