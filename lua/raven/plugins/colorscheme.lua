return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	enabled = false,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = false,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				-- Cursorline = { fg = "#8a9196" },
				-- GruvboxRed = { fg = "#ff7a6e" }, -- Use bright red instead of neutral
				-- GruvboxGreen = { fg = "#d9e06b" }, -- Use bright green
				-- GruvboxYellow = { fg = "#ffd97b" }, -- Use bright yellow
				-- GruvboxBlue = { fg = "#a7c7bf" }, -- Use bright blue
				-- GruvboxPurple = { fg = "#ebaab9" }, -- Use bright purple
				-- GruvboxAqua = { fg = "#b3e0a4" }, -- Use bright aqua
				-- GruvboxOrange = { fg = "#ffa96b" },
			},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	enabled = false,
-- 	config = function()
-- 		require("nordic").setup({
-- 			-- This callback can be used to override the colors used in the base palette.
-- 			on_palette = function(palette)
-- 				palette.black0 = "#191D24"
-- 			end,
-- 			-- This callback can be used to override the colors used in the extended palette.
-- 			after_palette = function(palette)
-- 				local U = require("nordic.utils")
-- 				palette.bg_visual = U.blend(palette.gray5, palette.bg, 0.25)
-- 			end,
-- 			-- This callback can be used to override highlights before they are applied.
-- 			on_highlight = function(highlights, palette)
-- 				highlights.LineNr = {
-- 					fg = palette.grey4,
-- 				}
-- 				highlights.Comment = {
-- 					fg = palette.grey5,
-- 				}

-- 				for _, highlight in pairs(highlights) do
-- 					highlight.italic = false
-- 				end
-- 			end,
-- 			-- Enable bold keywords.
-- 			bold_keywords = true,
-- 			-- Enable italic comments.
-- 			italic_comments = false,
-- 			-- Enable editor background transparency.
-- 			transparent = {
-- 				-- Enable transparent background.
-- 				bg = false,
-- 				-- Enable transparent background for floating windows.
-- 				float = false,
-- 			},
-- 			-- Enable brighter float border.
-- 			bright_border = false,
-- 			-- Reduce the overall amount of blue in the theme (diverges from base Nord).
-- 			reduced_blue = true,
-- 			-- Swap the dark background with the normal one.
-- 			swap_backgrounds = false,
-- 			-- Cursorline options.  Also includes visual/selection.
-- 			cursorline = {
-- 				-- Bold font in cursorline.
-- 				bold = false,
-- 				-- Bold cursorline number.
-- 				bold_number = true,
-- 				-- Available styles: 'dark', 'light'.
-- 				theme = "dark",
-- 				-- Blending the cursorline bg with the buffer bg.
-- 				blend = 0.85,
-- 			},
-- 			noice = {
-- 				-- Available styles: `classic`, `flat`.
-- 				style = "classic",
-- 			},
-- 			telescope = {
-- 				-- Available styles: `classic`, `flat`.
-- 				style = "flat",
-- 			},
-- 			leap = {
-- 				-- Dims the backdrop when using leap.
-- 				dim_backdrop = false,
-- 			},
-- 			ts_context = {
-- 				-- Enables dark background for treesitter-context window
-- 				dark_background = true,
-- 			},
-- 		})

-- 		vim.cmd.colorscheme("nordic")
-- 	end,
-- }
