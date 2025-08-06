local M = {}

-- Default configuration
local default_config = {
	bold = true,
	italic = {
		strings = false,
		comments = false,
		operators = false,
		folds = false,
	},
	underline = true,
	undercurl = true,
	underdashed = true,
	transparent = false,
	inverse = true,
	dim_inactive = false,
	styles = {
		sidebars = "dark", -- style for sidebars: "dark", "transparent"
		floats = "dark", -- style for floating windows: "dark", "transparent"
	},
}

-- User configuration
local config = default_config

-- Color palette
local function get_colors(opts)
	local colors = {
		-- Background colors
		bg = opts.transparent and "NONE" or "#181818",
		bg_light = "#282828",
		bg_lighter = "#383838",
		bg_dark = "#101010",

		-- Foreground colors
		fg = "#e4e4ef",
		fg_light = "#f4f4ff",
		fg_dark = "#a0a0a0",
		fg_comment = "#cc8c3c",

		-- Accent colors
		red = "#f43841",
		red_dark = "#cc1f28",
		green = "#73c936",
		green_dark = "#5a9a28",
		yellow = "#ffdd33",
		yellow_dark = "#cc9800",
		blue = "#96a6c8",
		blue_dark = "#565f73",
		purple = "#9e95c7",
		purple_dark = "#73729a",
		cyan = "#95a99c",
		cyan_dark = "#72847a",
		orange = "#ffb04a",
		orange_dark = "#cc8800",

		-- UI colors
		cursor = "#ffdd33",
		visual = "#484848",
		search = "#ffdd33",
		line_number = "#484848",
		line_number_current = "#ffdd33",
		statusline = opts.styles.sidebars == "transparent" and "NONE" or "#282828",
		pmenu = opts.styles.floats == "transparent" and "NONE" or "#282828",
		pmenu_sel = "#484848",

		-- Git colors
		git_add = "#73c936",
		git_change = "#ffdd33",
		git_delete = "#f43841",

		-- Diagnostic colors
		error = "#ff6b6b",
		warning = "#ffdd33",
		info = "#74c0fc",
		hint = "#6b7280",
	}

	-- Handle dim inactive
	if opts.dim_inactive then
		colors.bg_inactive = "#151515"
		colors.fg_inactive = "#8a8a8a"
	end

	return colors
end

-- Helper function to set highlight groups
local function highlight(group, opts, config_opts)
	local hl = {}
	if opts.fg then
		hl.fg = opts.fg
	end
	if opts.bg then
		hl.bg = opts.bg
	end
	if opts.sp then
		hl.sp = opts.sp
	end

	if opts.bold and config_opts.bold then
		hl.bold = true
	end
	if opts.italic and config_opts.italic then
		hl.italic = true
	end
	if opts.underline and config_opts.underline then
		hl.underline = true
	end
	if opts.undercurl and config_opts.undercurl then
		hl.undercurl = true
	end
	if opts.underdashed and config_opts.underdashed then
		hl.underdashed = true
	end
	if opts.reverse and config_opts.inverse then
		hl.reverse = true
	end
	if opts.strikethrough then
		hl.strikethrough = true
	end
	vim.api.nvim_set_hl(0, group, hl)
end

-- Setup function
function M.setup(opts)
	config = vim.tbl_deep_extend("force", default_config, opts or {})
end

-- Load the colorscheme
function M.load()
	-- Reset existing highlights
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "gruber-darker"
	vim.o.background = "dark"
	vim.o.termguicolors = true

	local colors = get_colors(config)

	-- Editor highlights
	highlight("Normal", { fg = colors.fg, bg = colors.bg }, config)
	highlight("NormalFloat", {
		fg = colors.fg,
		bg = config.styles.floats == "transparent" and "NONE" or colors.bg_light,
	}, config)
	highlight("FloatBorder", { fg = colors.fg_dark, bg = colors.bg_light }, config)
	highlight("Cursor", { fg = colors.bg, bg = colors.cursor }, config)
	highlight("CursorLine", { bg = colors.bg }, config)
	highlight("CursorColumn", { bg = colors.bg_light }, config)
	highlight("ColorColumn", { bg = colors.bg_light }, config)
	highlight("LineNr", { fg = colors.line_number }, config)
	highlight("CursorLineNr", { fg = colors.line_number_current }, config)
	highlight("SignColumn", { bg = colors.bg }, config)
	highlight("Folded", {
		fg = colors.fg_comment,
		bg = colors.bg_light,
		italic = config.italic.folds,
	}, config)
	highlight("FoldColumn", { fg = colors.fg_comment, bg = colors.bg }, config)
	highlight("VertSplit", { fg = colors.bg_lighter }, config)
	highlight("WinSeparator", { fg = colors.bg_lighter }, config)

	-- Dim inactive windows
	if config.dim_inactive then
		highlight("NormalNC", { fg = colors.fg_inactive, bg = colors.bg_inactive }, config)
	end

	-- Search and selection
	highlight("Visual", { bg = colors.visual }, config)
	highlight("VisualNOS", { bg = colors.visual }, config)
	highlight("Search", { bg = colors.search, fg = colors.bg }, config)
	highlight("IncSearch", { bg = colors.yellow, fg = colors.bg }, config)
	highlight("CurSearch", { bg = colors.yellow, fg = colors.bg }, config)

	-- Statusline
	highlight("StatusLine", { fg = colors.fg, bg = colors.statusline }, config)
	highlight("StatusLineNC", { fg = colors.fg_dark, bg = colors.statusline }, config)
	highlight("TabLine", { fg = colors.fg_dark, bg = colors.bg_light }, config)
	highlight("TabLineFill", { bg = colors.bg_light }, config)
	highlight("TabLineSel", { fg = colors.fg, bg = colors.bg }, config)

	-- Popup menu
	highlight("Pmenu", { fg = colors.fg, bg = colors.pmenu }, config)
	highlight("PmenuSel", { fg = colors.fg, bg = colors.pmenu_sel }, config)
	highlight("PmenuSbar", { bg = colors.bg_lighter }, config)
	highlight("PmenuThumb", { bg = colors.fg_dark }, config)

	-- Messages
	highlight("ErrorMsg", { fg = colors.error }, config)
	highlight("WarningMsg", { fg = colors.warning }, config)
	highlight("MoreMsg", { fg = colors.green }, config)
	highlight("Question", { fg = colors.blue }, config)
	highlight("ModeMsg", { fg = colors.fg }, config)

	-- Syntax highlighting
	highlight("Comment", {
		fg = colors.fg_comment,
		italic = config.italic.comments,
	}, config)
	highlight("Constant", { fg = colors.green }, config)
	highlight("String", {
		fg = colors.green,
		italic = config.italic.strings,
	}, config)
	highlight("Character", { fg = colors.green }, config)
	highlight("Number", { fg = colors.red }, config)
	highlight("Boolean", { fg = colors.red }, config)
	highlight("Float", { fg = colors.red }, config)

	highlight("Identifier", { fg = colors.fg }, config)
	highlight("Function", { fg = colors.yellow }, config)

	highlight("Statement", { fg = colors.yellow }, config)
	highlight("Conditional", { fg = colors.yellow }, config)
	highlight("Repeat", { fg = colors.yellow }, config)
	highlight("Label", { fg = colors.yellow }, config)
	highlight("Operator", {
		fg = colors.fg,
		italic = config.italic.operators,
	}, config)
	highlight("Keyword", { fg = colors.yellow, bold = true }, config)
	highlight("Exception", { fg = colors.yellow }, config)

	highlight("PreProc", { fg = colors.purple }, config)
	highlight("Include", { fg = colors.purple }, config)
	highlight("Define", { fg = colors.purple }, config)
	highlight("Macro", { fg = colors.blue }, config)
	highlight("PreCondit", { fg = colors.purple }, config)

	highlight("Type", { fg = colors.blue }, config)
	highlight("StorageClass", { fg = colors.blue }, config)
	highlight("Structure", { fg = colors.blue }, config)
	highlight("Typedef", { fg = colors.blue }, config)

	highlight("Special", { fg = colors.cyan }, config)
	highlight("SpecialChar", { fg = colors.green }, config)
	highlight("Tag", { fg = colors.cyan }, config)
	highlight("Delimiter", { fg = colors.fg }, config)
	highlight("SpecialComment", { fg = colors.fg_comment }, config)
	highlight("Debug", { fg = colors.red }, config)

	highlight("Underlined", { underline = true }, config)
	highlight("Ignore", { fg = colors.bg }, config)
	highlight("Error", { fg = colors.error }, config)
	highlight("Todo", { fg = colors.yellow, bold = true }, config)
	highlight("NoneText", { fg = colors.fg_dark }, config)
	highlight("Whitespace", { fg = colors.bg_light }, config)

	-- Treesitter highlights
	highlight("@variable", { fg = colors.fg }, config)
	highlight("@variable.builtin", { fg = colors.yellow, bold = true }, config)
	highlight("@variable.parameter", { fg = colors.fg }, config)
	highlight("@variable.member", { fg = colors.fg }, config)

	highlight("@constant", { fg = colors.fg }, config)
	highlight("@constant.builtin", { fg = colors.yellow, bold = true }, config)
	highlight("@constant.macro", { fg = colors.blue }, config)

	highlight("@module", { fg = colors.cyan }, config)
	highlight("@label", { fg = colors.yellow }, config)

	highlight("@string", {
		fg = colors.green,
		italic = config.italic.strings,
	}, config)
	highlight("@string.escape", { fg = colors.yellow, bold = true }, config)
	highlight("@string.regex", { fg = colors.cyan }, config)

	highlight("@character", { fg = colors.green }, config)
	highlight("@character.special", { fg = colors.cyan }, config)

	highlight("@number", { fg = colors.purple }, config)
	highlight("@number.float", { fg = colors.purple }, config)

	highlight("@boolean", { fg = colors.yellow, bold = true }, config)

	highlight("@function", { fg = colors.blue }, config)
	highlight("@function.builtin", { fg = colors.yellow, bold = true }, config)
	highlight("@function.call", { fg = colors.blue }, config)
	highlight("@function.macro", { fg = colors.blue }, config)

	highlight("@function.method", { fg = colors.blue }, config)

	highlight("@constructor", { fg = colors.blue }, config)
	highlight("@constructor.lua", { fg = colors.fg }, config)

	highlight("@operator", {
		fg = colors.fg,
		italic = config.italic.operators,
	}, config)

	highlight("@keyword", { fg = colors.yellow, bold = true }, config)
	highlight("@keyword.function", { fg = colors.yellow, bold = true }, config)
	highlight("@keyword.operator", { fg = colors.yellow, bold = true }, config)
	highlight("@keyword.return", { fg = colors.yellow, bold = true }, config)
	highlight("@keyword.conditional", { fg = colors.yellow, bold = true }, config)
	highlight("@keyword.repeat", { fg = colors.yellow, bold = true }, config)
	highlight("@keyword.import", { fg = colors.yellow, bold = true }, config)
	highlight("@keyword.exception", { fg = colors.yellow }, config)

	highlight("@type", { fg = colors.cyan }, config)
	highlight("@type.parameter", { fg = colors.yellow }, config)
	highlight("@type.builtin", { fg = colors.yellow }, config)
	highlight("@type.qualifier", { fg = colors.yellow }, config)
	highlight("@type.return", { fg = colors.yellow }, config)

	highlight("@property", { fg = colors.fg }, config)
	highlight("@attribute", { fg = colors.purple }, config)

	highlight("@comment", {
		fg = colors.fg_comment,
		italic = config.italic.comments,
	}, config)
	highlight("@comment.documentation", {
		fg = colors.fg_comment,
		italic = config.italic.comments,
	}, config)

	highlight("@punctuation.delimiter", { fg = colors.fg }, config)
	highlight("@punctuation.bracket", { fg = colors.fg }, config)
	highlight("@punctuation.special", { fg = colors.cyan }, config)

	highlight("@tag", { fg = colors.blue }, config)
	highlight("@tag.attribute", { fg = colors.fg }, config)
	highlight("@tag.delimiter", { fg = colors.fg }, config)

	highlight("@php_tag", { fg = colors.purple }, config)

	highlight("LspReferenceText", { bg = colors.bg_lighter }, config)
	highlight("LspReferenceRead", { bg = colors.bg_lighter }, config)
	highlight("LspReferenceWrite", { bg = colors.bg_lighter }, config)
	highlight("LspSignatureActiveParameter", { fg = colors.yellow, bold = true }, config)

	-- Diagnostic highlights
	highlight("DiagnosticError", { fg = colors.error }, config)
	highlight("DiagnosticWarn", { fg = colors.warning }, config)
	highlight("DiagnosticInfo", { fg = colors.info }, config)
	highlight("DiagnosticHint", { fg = colors.hint }, config)

	highlight("DiagnosticVirtualTextError", { fg = colors.error, bg = colors.bg }, config)
	highlight("DiagnosticVirtualTextWarn", { fg = colors.warning, bg = colors.bg }, config)
	highlight("DiagnosticVirtualTextInfo", { fg = colors.info, bg = colors.bg }, config)
	highlight("DiagnosticVirtualTextHint", { fg = colors.hint, bg = colors.bg }, config)
	highlight("DiagnosticVirtualTextUnnecessary", { fg = colors.hint, bg = colors.bg }, config)

	highlight("DiagnosticUnderlineError", { sp = colors.error, underdashed = true }, config)
	highlight("DiagnosticUnderlineWarn", { sp = colors.warning, underdashed = true }, config)
	highlight("DiagnosticUnderlineInfo", { sp = colors.info, underdashed = true }, config)
	highlight("DiagnosticUnderlineHint", { sp = colors.hint, underdashed = true }, config)
	highlight("DiagnosticUnnecessary", { fg = colors.hint, sp = colors.hint, underdashed = true }, config)

	-- Mini.StatusLine
	highlight("MiniStatuslineFilename", { fg = colors.fg }, config)
	highlight("MiniStatuslineModeNormal", { bg = colors.yellow, fg = colors.bg, bold = true }, config)
	highlight("MiniStatuslineModeVisual", { bg = colors.purple, fg = colors.bg, bold = true }, config)
	highlight("MiniStatuslineModeCommand", { bg = colors.purple, fg = colors.bg, bold = true }, config)
end

-- Convenience function for vim.cmd.colorscheme()
function M.colorscheme()
	M.load()
end

return M
