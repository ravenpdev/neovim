return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	config = function()
		require("nordic").setup({
			-- This callback can be used to override the colors used in the base palette.
			on_palette = function(palette) end,
			-- This callback can be used to override the colors used in the extended palette.
			after_palette = function(palette)
				palette.bg = palette.bg_dark
				palette.bg_visual = palette.grey1
			end,
			-- This callback can be used to override highlights before they are applied.
			on_highlight = function(highlights, palette)
				highlights.LineNr = { fg = palette.gray4 }
				highlights.Comment = { fg = palette.gray5 }
			end,
			-- Enable bold keywords.
			bold_keywords = true,
			-- Enable italic comments.
			italic_comments = false,
			-- Enable editor background transparency.
			transparent = {
				-- Enable transparent background.
				bg = false,
				-- Enable transparent background for floating windows.
				float = false,
			},
			-- Enable brighter float border.
			bright_border = false,
			-- Reduce the overall amount of blue in the theme (diverges from base Nord).
			reduced_blue = true,
			-- Swap the dark background with the normal one.
			swap_backgrounds = false,
			-- Cursorline options.  Also includes visual/selection.
			cursorline = {
				-- Bold font in cursorline.
				bold = false,
				-- Bold cursorline number.
				bold_number = true,
				-- Available styles: 'dark', 'light'.
				theme = "dark",
				-- Blending the cursorline bg with the buffer bg.
				blend = 0.85,
			},
			noice = {
				-- Available styles: `classic`, `flat`.
				style = "classic",
			},
			telescope = {
				-- Available styles: `classic`, `flat`.
				style = "flat",
			},
			leap = {
				-- Dims the backdrop when using leap.
				dim_backdrop = false,
			},
			ts_context = {
				-- Enables dark background for treesitter-context window
				dark_background = true,
			},
		})

		vim.cmd.colorscheme("nordic")
	end,
}

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "auto", -- auto, main, moon, or dawn
-- 			dark_variant = "main", -- main, moon, or dawn
-- 			dim_inactive_windows = false,
-- 			extend_background_behind_borders = true,
--
-- 			enable = {
-- 				terminal = true,
-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
-- 				migrations = true, -- Handle deprecated options automatically
-- 			},
--
-- 			styles = {
-- 				bold = true,
-- 				italic = false,
-- 				transparency = false,
-- 			},
--
-- 			highlight_groups = {
-- 				Keyword = { bold = true },
-- 				Boolean = { bold = true },
-- 				-- StatusLine = { fg = "love", bg = "love", blend = 15 },
-- 				-- VertSplit = { fg = "muted", bg = "muted" },
-- 				-- Visual = { fg = "base", bg = "text", inherit = false },
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
