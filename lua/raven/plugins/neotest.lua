return {
	"nvim-neotest/neotest",
	commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",

		"V13Axel/neotest-pest",
		"olimorris/neotest-rspec",
		"jfpedroza/neotest-elixir",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-rspec"),
				require("neotest-pest"),
				require("neotest-elixir"),
			},
		})

		vim.keymap.set("n", "<leader>tn", function()
			neotest.run.run()
		end, { desc = "Run nearest test" })

		-- Run the current file
		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Run current file" })

		-- Run all tests
		vim.keymap.set("n", "<leader>ta", function()
			neotest.run.run(vim.fn.getcwd())
		end, { desc = "Run all tests" })

		-- Run the last test
		vim.keymap.set("n", "<leader>tl", function()
			neotest.run.run_last()
		end, { desc = "Run last test" })

		-- Debug the nearest test
		-- vim.keymap.set("n", "<leader>td", function()
		-- 	neotest.run.run({ strategy = "dap" })
		-- end, { desc = "Debug nearest test" })

		-- Stop running tests
		vim.keymap.set("n", "<leader>ts", function()
			neotest.run.stop()
		end, { desc = "Stop tests" })

		-- Toggle test summary
		vim.keymap.set("n", "<leader>tt", function()
			neotest.summary.toggle()
		end, { desc = "Toggle test summary" })

		-- Show test output
		vim.keymap.set("n", "<leader>to", function()
			neotest.output.open({ enter = true, auto_close = true })
		end, { desc = "Show test output" })

		-- Show test output panel
		vim.keymap.set("n", "<leader>tp", function()
			neotest.output_panel.toggle()
		end, { desc = "Toggle test output panel" })

		-- Jump to next failed test
		vim.keymap.set("n", "]t", function()
			neotest.jump.next({ status = "failed" })
		end, { desc = "Next failed test" })

		-- Jump to previous failed test
		vim.keymap.set("n", "[t", function()
			neotest.jump.prev({ status = "failed" })
		end, { desc = "Previous failed test" })

		-- Watch file for changes and run tests
		vim.keymap.set("n", "<leader>tw", function()
			neotest.watch.toggle(vim.fn.expand("%"))
		end, { desc = "Watch file" })
	end,
}
