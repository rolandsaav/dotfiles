return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		picker = { enabled = true },
	},
	keys = {
		{ "<Leader>ff", function() Snacks.picker.smart() end,   desc = "Smart Find Files" },
		{ "<Leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<Leader>fg", function() Snacks.picker.grep() end,    desc = "Grep" },
	},
}
