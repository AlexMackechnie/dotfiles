vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_highlight_opened_files = 1

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
        preserve_window_proportions = true
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false
    },
    update_focused_file = {
        enable = true
    }
})

