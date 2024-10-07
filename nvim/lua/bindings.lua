-- Telescope
local telescope = require("telescope.builtin")

vim.keymap.set('n', '<leader>f?', telescope.builtin, { desc = "Telescope find picker" })
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fm', telescope.man_pages, { desc = "Telescope find man pages" })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = "Telescope find help tags" })


vim.keymap.set('n', '<leader>fr', telescope.lsp_references, { desc = "Telescope lsp references" })
vim.keymap.set('n', '<leader>fd', telescope.lsp_definitions, { desc = "Telescope lsp definitions" })

-- NvimTree
local nvimtree = require("nvim-tree.api")

local toggleTreeAndFocusIfClosed = function()
    if nvimtree.tree.is_visible() then
        nvimtree.tree.close()
    else
        nvimtree.tree.toggle()
    end
end


vim.keymap.set('n', '<leader>ot', toggleTreeAndFocusIfClosed, { desc = "Toggle nvim tree" })

-- Tabs

vim.keymap.set('n', '<M-n>', '<cmd>tabnext<cr>', { desc = "Next tab" })
vim.keymap.set('n', '<M-p>', '<cmd>tabprevious<cr>', { desc = "Previouse tab" })
