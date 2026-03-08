local nvimtreeapi = require("nvim-tree.api")

vim.o.relativenumber = true

-- scroll offset
vim.o.so = 10

-- horizontal scroll offset
vim.o.sidescrolloff = 10
vim.o.sidescroll = 5

vim.opt.signcolumn = "number"

-- folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevelstart = 4
vim.opt.foldlevel = 99

-- tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false

vim.keymap.set('n', '<Leader>gf', function() vim.lsp.buf.format() end)
vim.keymap.set('n', '<Leader>d', function() vim.diagnostic.open_float() end)
-- vim.diagnostic.config({ virtual_lines = true })

vim.keymap.set("i", ';;', "<Esc>A;<Esc>o")

-- Normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })

-- Insert mode (return to exact insert position)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true })

-- Visual mode (reselect and reindent)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set('n', 'gD', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end)

vim.keymap.set('n', '<Leader>tn', ":tabnew<CR>", { silent = true })
vim.keymap.set('n', '<Leader>tc', ":tabclose<CR>", { silent = true })

vim.keymap.set('n', '-', function()
	nvimtreeapi.tree.toggle({
		find_file = true
	})
end)
