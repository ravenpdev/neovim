-- return {
-- 	"foxoman/vim-helix",
-- 	priority = 10000,
-- 	lazy = false,
-- 	config = function ()
-- 		vim.cmd("colorscheme helix-dark")
-- 	end
-- }

-- return {
-- 	"embark-theme/vim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme embark")
-- 		vim.cmd([[
-- 			highlight Keyword gui=bold cterm=bold
-- 		]])
-- 	end,
-- }

return {
	"ravenpdev/gruber-darker.nvim",
	name = "gruber-darker",
	priority = 1000,
	enabled = false,
	lazy = false,
	config = function()
		require("gruber-darker").load()
	end,
}
