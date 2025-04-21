return {
    -- The plugin location on GitHub
    "vimwiki/vimwiki",
    -- The event that triggers the plugin
    event = "BufEnter *.md",
    -- The keys that trigger the plugin
    keys = { "<leader>ww", "<leader>wt" },
    -- The configuration for the plugin
    init = function()
        local path = os.getenv("HOME") .. "/vimwiki"
        -- Create the directory if it doesn't exist
        if vim.fn.isdirectory(path) == 0 then
            vim.fn.mkdir(path, "p", 0700)
        end

        vim.g.vimwiki_list = {
            {
                path = "/mnt/d/obsidian-notes",
                syntax = "markdown",
                ext = "md",
            },
            {
                path = path,
                syntax = "markdown",
                ext = "md",
            },
        }
        vim.g.vimwiki_ext2syntax = vim.empty_dict()
    end,
    config = function()
    end
}
