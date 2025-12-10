return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = false,
	},
	keys = {
		{
			"<leader>gb",
			"<CMD>Gitsigns toggle_current_line_blame<CR>",
			desc = "Toggle current line blame",
		},
	},
}
