	return {
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		config = function()
			local map = vim.keymap

			map.set("n", "gw", function()
				require("flash").jump()
			end, { desc = "Flash" })

			vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#e4e4ef", bg = "#f43841", bold = true })
			vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#e4e4ef", bg = "#181818" })
			vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#e4e4ef", bg = "#181818" })
		end,
	}
