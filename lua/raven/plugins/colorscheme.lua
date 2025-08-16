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
