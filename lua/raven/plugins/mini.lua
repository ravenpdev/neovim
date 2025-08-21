return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.icons").setup()

		require("mini.pairs").setup()

		require("mini.files").setup()

		local MiniStatusline = require("mini.statusline")
		require("mini.statusline").setup({
			use_icons = false,
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local function relative_filename()
						local filepath = vim.fn.expand("%:p")
						if filepath == "" then
							return "[No Name]"
						end
						return vim.fn.fnamemodify(filepath, ":~:.")
					end
					local filename = relative_filename()
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local function diagnostic_section()
						local diagnostics = vim.diagnostic.get(0)
						local counts = { error = 0, warn = 0, info = 0, hint = 0 }

						for _, diagnostic in ipairs(diagnostics) do
							if diagnostic.severity == vim.diagnostic.severity.ERROR then
								counts.error = counts.error + 1
							elseif diagnostic.severity == vim.diagnostic.severity.WARN then
								counts.warn = counts.warn + 1
							elseif diagnostic.severity == vim.diagnostic.severity.INFO then
								counts.info = counts.info + 1
							elseif diagnostic.severity == vim.diagnostic.severity.HINT then
								counts.hint = counts.hint + 1
							end
						end

						local parts = {}
						local icons = { error = "● ", warn = "● ", info = "● ", hint = "● " }

						if counts.error > 0 then
							table.insert(parts, "%#DiagnosticError#" .. icons.error .. counts.error)
						end
						if counts.warn > 0 then
							table.insert(parts, "%#DiagnosticWarn#" .. icons.warn .. counts.warn)
						end
						if counts.info > 0 then
							table.insert(parts, "%#DiagnosticInfo#" .. icons.info .. counts.info)
						end
						if counts.hint > 0 then
							table.insert(parts, "%#DiagnosticHint#" .. icons.hint .. counts.hint)
						end

						return table.concat(parts, " ")
					end
					local diagnostics = diagnostic_section()
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local function location_info()
						local line = vim.fn.line(".")
						local col = vim.fn.col(".")
						return string.format("%d:%d", line, col)
					end
					local location = location_info()
					local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						"%<",
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=",
						{ hl = "MiniStatuslineDevinfo", strings = { git } },
						"%=",
						{ hl = "MiniStatuslineFileinfo", strings = { diagnostics } },
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo, search, location } },
					})
				end,
			},
		})

		local map = vim.keymap
		map.set("n", "<leader>e", function()
			require("mini.files").open()
		end, { desc = "Find files" })
	end,
}
