return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = { enabled = true },
	},
	keys = {
		{ "<leader>fp", function() Snacks.picker() end, desc = "Find Pickers" },
		{ "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "-", function() Snacks.picker.explorer() end, desc = "Smart Find Files" },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
	}
}
