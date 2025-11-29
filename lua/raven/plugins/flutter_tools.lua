return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			dev_log = {
				enabled = true,
				filter = nil, -- optional callback to filter the log
				-- takes a log_line as string argument; returns a boolean or nil;
				-- the log_line is only added to the output if the function returns true
				notify_errors = false, -- if there is an error whilst running then notify the user
				open_cmd = "split", -- command to use to open the log buffer
				focus_on_open = true, -- focus on the newly opened log window
			},
			lsp = {
				color = {
					enabled = true,
				},
			},
		})
	end,
	keys = {
		{
			"<leader>Fd",
			"<CMD>FlutterDevices<CR>",
			desc = "List of devices",
		},
		{
			"<leader>Fl",
			"<CMD>FlutterLogToggle<CR>",
			desc = "Toggles the log buffer",
		},
	},
}
