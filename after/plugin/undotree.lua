vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.g.undotree_WindowLayout = 2

if vim.fn.has("persistent_undo") == 1 then
    local target_path =  os.getenv("HOME") .. "/.vim/undodir"

    -- Create the directory if it doesn't exist
    if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", 0700)
    end

    -- Set the undo directory and enable undo files
    vim.o.undodir = target_path
    vim.o.undofile = true
end

