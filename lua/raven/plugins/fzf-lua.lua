return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	config = function()
		require("fzf-lua").setup({
			winopts = {
				border = "none",
				preview = {
					border = "none",
				},
			},
			fzf_colors = {
				true, -- inherit fzf colors that aren't specified below from
				["pointer"] = { "fg", "Normal" },
				["hl"] = { "fg", "Keyword" },
				["hl+"] = { "fg", "Keyword" },
			},
			fzf_opts = {
				["--padding"] = "1,2,1,2", -- Additional internal padding if needed
			},
			keymap = {
				fzf = {
					["tab"] = "down",
					["shift-tab"] = "up",
				},
			},
			files = {
				file_icons = false,
			},
		})

		require("fzf-lua").register_ui_select()

		local map = vim.keymap

		map.set("n", "<leader>f", require("fzf-lua").files, { desc = "Find files" })
		map.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Find buffers" })
		map.set("n", "<leader>/", require("fzf-lua").live_grep, { desc = "Live grep" })

		-- LSP
		map.set("n", "<leader>k", function()
			vim.lsp.buf.hover()
		end, { desc = "LSP hover documentation" })
		map.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP rename" })
		map.set("n", "gd", require("fzf-lua").lsp_definitions, { desc = "Goto definition" })
		map.set("n", "gD", require("fzf-lua").lsp_declarations, { desc = "Goto declaration" })
		map.set("n", "gr", require("fzf-lua").lsp_references, { desc = "Goto references" })
		map.set("n", "gi", require("fzf-lua").lsp_implementations, { desc = "Goto implementation" })
		map.set("n", "gy", require("fzf-lua").lsp_typedefs, { desc = "Goto type definitions" })
		map.set("n", "<leader>s", require("fzf-lua").lsp_document_symbols, { desc = "Document symbols" })
		map.set("n", "<leader>d", require("fzf-lua").lsp_document_diagnostics, { desc = "Document diagnostics" })
		map.set("n", "<leader>D", require("fzf-lua").lsp_workspace_diagnostics, { desc = "Workspace diagnostics" })
		map.set({ "n", "v" }, "<leader>a", require("fzf-lua").lsp_code_actions, { desc = "Code actions" })
	end,
}
