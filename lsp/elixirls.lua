local blink = require("blink.cmp")
return {
	cmd = { "elixir-ls" },
	root_markers = { "mix.exs", ".git" },
	filetypes = { "elixir", "eex", "heex", "surface" },
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
