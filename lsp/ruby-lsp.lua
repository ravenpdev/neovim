local blink = require("blink.cmp")
return {
	cmd = { "ruby-lsp" },

	-- File types that trigger the LSP
	filetypes = { "ruby", "erb", "rakefile", "gemfile" },

	-- Root directory patterns to detect Ruby projects
	root_markers = { "Gemfile", "Rakefile", "config.ru", ".git" },

	settings = {
		rubyLsp = {
			-- Enable/disable specific features
			enabledFeatures = {
				codeLens = true,
				completion = true,
				definition = true,
				diagnostics = true,
				documentHighlights = true,
				documentLink = true,
				documentSymbols = true,
				foldingRanges = true,
				formatting = true,
				hover = true,
				inlayHint = true,
				onTypeFormatting = true,
				selectionRanges = true,
				semanticHighlighting = true,
				signatureHelp = true,
				typeHierarchy = true,
				workspaceSymbol = true,
			},

			-- Formatter configuration
			formatter = "rubocop", -- or "syntax_tree" or "none"

			-- Linter configuration
			linters = { "rubocop" }, -- can also include "reek", "sorbet"

			-- Index configuration
			indexing = {
				-- Include/exclude patterns for indexing
				includedPatterns = { "**/*.rb", "**/*.rake", "**/*.gemspec", "**/Gemfile", "**/Rakefile" },
				excludedPatterns = { "**/tmp/**", "**/vendor/**", "**/node_modules/**" },
			},
		},
	},
	init_options = {
		formatter = "auto",
	},
	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		blink.get_lsp_capabilities(),
		{
			fileOperations = {
				didRename = true,
				willRename = true,
			},
		}
	),
}
