return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			-- Go
			go = { "goimports", "gofmt" },

			-- Lua
			lua = { "stylua" },

			-- web
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },

			svelte = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			-- yaml = { "prettier" },
			-- markdown = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },

			-- Python
			-- python = { "isort", "black" },

			-- PHP/Laravel
			php = { "pint" },

			-- ruby = { "rubocop" },

			-- Shell
			-- sh = { "shfmt" },
			-- bash = { "shfmt" },

			-- Other (system tools)
			-- rust = { "rustfmt" }, -- comes with Rust installation

			-- Additional file types (uncomment as needed)
			-- markdown = { "markdownlint" },
			-- yaml = { "yamllint" },
			-- toml = { "taplo" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
