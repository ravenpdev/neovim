return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		preset = "helix",
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		icons = {
			rules = false,
		},
		win = {
			border = "none",
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
