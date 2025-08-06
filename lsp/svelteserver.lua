return {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_markers = {
		"svelte.config.js",
		"svelte.config.mjs",
		"svelte.config.cjs",
		"package.json",
		".git",
	},
	settings = {
		svelte = {
			plugin = {
				html = {
					completions = {
						enable = true,
						emmet = true,
					},
				},
				svelte = {
					completions = {
						enable = true,
					},
				},
				css = {
					completions = {
						enable = true,
						emmet = true,
					},
				},
			},
		},
	},
}
