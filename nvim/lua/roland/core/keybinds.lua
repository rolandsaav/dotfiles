local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})


vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<cr>", {})

vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

vim.keymap.set("n", "<M-CR>", "<cmd>CodeActionMenu<CR>", {})
vim.keymap.set("n", "<leader>i", "<cmd>CodeActionMenu<CR>", {})
vim.keymap.set("n", "rr", "<cmd>CodeActionMenu<CR>", {})
