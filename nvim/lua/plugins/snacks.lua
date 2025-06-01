return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = { enabled = true },
		words = { enabled = true },
		scroll = { enabled = true },
		indent = { enabled = true },
		explorer = { enabled = true, replace_netrw = true},
	},
	keys = {
		{ "<leader>fp", function() Snacks.picker() end,                                         desc = "Find Pickers" },
		{ "<leader>ff", function() Snacks.picker.git_files() end,                                   desc = "Find Git Files" },
		{ "<leader>fs", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
		{ "<leader>fh", function() Snacks.picker.help() end,                                   desc = "Smart Find Files" },
		{ "-",          function() Snacks.picker.explorer() end,                                desc = "File Explorer" },
		{ "<leader>/",  function() Snacks.picker.grep() end,                                    desc = "Grep" },
		{ "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		{ "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
		{
			"<leader>td",
			function()
				if Snacks.dim.enabled then
					Snacks.dim.disable()
				Snacks.notifier.notify("Disabled dynamic dimming")
				else
					Snacks.dim.enable()
					Snacks.dim()
				Snacks.notifier.notify("Enabled dynamic dimming")
				end
			end,
			desc = "Toggle dynamic dimming"
		},
		{
			"<leader>ts",
			function()
				if Snacks.scroll.enabled then
					Snacks.scroll.disable()
				Snacks.notifier.notify("Disable smooth scroll")
				else
					Snacks.scroll.enable()
				Snacks.notifier.notify("Enable smooth scroll")
				end
			end,
			desc = "Toggle smooth scrolling"
		},
		{
			"<leader>ti",
			function()
				if Snacks.indent.enabled then
					Snacks.indent.disable()
				Snacks.notifier.notify("Disable indent guide")
				else
					Snacks.indent.enable()
				Snacks.notifier.notify("Enable indent guide")
				end
			end,
			desc = "Toggle indent guide"
		},
	}
}
