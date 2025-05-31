return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		local harpoon_extensions = require("harpoon.extensions")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end)
	end
}
