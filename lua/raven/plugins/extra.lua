return {
	{
		"tpope/vim-sleuth",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "┊",
				tab_char = "┊",
				highlight = { "Whitespace" },
			},
			scope = {
				enabled = false,
			},
		},
	},
}
