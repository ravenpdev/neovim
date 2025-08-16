local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "none"
	opts.focusable = true
	opts.max_height = 40
	opts.wrap = true

	-- Calculate appropriate width based on content
	local max_line_length = 0
	if type(contents) == "table" then
		for _, line in ipairs(contents) do
			max_line_length = math.max(max_line_length, vim.fn.strdisplaywidth(line))
		end
	elseif type(contents) == "string" then
		for line in contents:gmatch("[^\n]*") do
			max_line_length = math.max(max_line_length, vim.fn.strdisplaywidth(line))
		end
	end

	-- Set width with padding, but cap at 80
	local desired_width = math.min(max_line_length + 4, 80) -- +4 for your padding
	opts.width = desired_width

	-- Add padding by modifyig contents
	if type(contents) == "table" then
		local padded_contents = {}
		table.insert(padded_contents, " ")
		for _, line in ipairs(contents) do
			table.insert(padded_contents, "  " .. line .. "  ")
		end
		table.insert(padded_contents, " ")
		contents = padded_contents
	elseif type(contents) == "string" then
		contents = "  \n  " .. contents:gsub("\n", "\n  ") .. "  \n  "
	end

	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.api.nvim_create_autocmd({ "LspAttach" }, {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		client.server_capabilities.semanticTokensProvider = nil
-- 	end,
-- })

-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	underline = true,
-- 	update_in_insert = false,
-- 	severity_sort = true,
-- 	float = {
-- 		border = "rounded",
-- 		source = true,
-- 	},
-- 	signs = {
-- 		priority = 100,
-- 		text = {
-- 			[vim.diagnostic.severity.ERROR] = "● ",
-- 			[vim.diagnostic.severity.WARN] = "● ",
-- 			[vim.diagnostic.severity.INFO] = "● ",
-- 			[vim.diagnostic.severity.HINT] = "● ",
-- 		},
-- 		numhl = {
-- 			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
-- 			[vim.diagnostic.severity.WARN] = "WarningMsg",
-- 		},
-- 	},
-- })
