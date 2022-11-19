local nnoremap = require("alex.keymap").nnoremap

nnoremap("<leader>ll", "<cmd>Ex<CR>")
nnoremap("<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep hidden=true no_ignore=true<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<C-H>", "<C-W>h")
nnoremap("<C-J>", "<C-W>j")
nnoremap("<C-K>", "<C-W>k")
nnoremap("<C-L>", "<C-W>l")
nnoremap("<leader>fh", "<cmd>vertical resize +5<cr>")
nnoremap("<leader>t", "<cmd>NvimTreeToggle<cr>")
nnoremap("<leader>mm", function() require("harpoon.mark").add_file() end)
nnoremap("<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end)

