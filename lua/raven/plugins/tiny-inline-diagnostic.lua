return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				priority = 100,
				text = {
					[vim.diagnostic.severity.ERROR] = "●",
					[vim.diagnostic.severity.WARN] = "●",
					[vim.diagnostic.severity.INFO] = "●",
					[vim.diagnostic.severity.HINT] = "●",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarningMsg",
				},
			},
		}) -- Disable default virtual text

		require("tiny-inline-diagnostic").setup()
	end,
}
