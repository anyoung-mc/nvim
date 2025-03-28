function ColorMyPencils(color)
    color = color or 'adwaita'
    vim.cmd.colorscheme(color)

    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "Mofiqul/adwaita.nvim",
        name = "adwaita",
        lazy = false,
        priority = 1000,
        -- configure and set on startup
        config = function()
            vim.g.adwaita_darker = false            -- for darker version
            vim.g.adwaita_disable_cursorline = true -- to disable cursorline
            vim.g.adwaita_transparent = false       -- makes the background transparent
            vim.cmd('colorscheme adwaita')
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = false,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },
}
