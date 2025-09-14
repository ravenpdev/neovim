vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.lazyvim_prettier_needs_config = true

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.showbreak = "↪ "
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.breakindentopt = "shift:2"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visual settings
vim.o.termguicolors = true
vim.opt.guicursor = "n-v-c:block-Cursor"
vim.opt.signcolumn = "yes"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false

-- File handling
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Behavior settings
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.clipboard:append("unnamedplus")

-- Split setting
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.fillchars:append({
	vert = "┊", -- Thicker vertical bar
	horiz = "┈", -- Thicker horizontal bar
})

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- highlight yanked text
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	group = augroup,
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- })

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- local function close_other_buffers()
-- 	local current_buf = vim.api.nvim_get_current_buf()
-- 	local buffers = vim.api.nvim_list_bufs()
--
-- 	for _, buf in ipairs(buffers) do
-- 		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
-- 			vim.api.nvim_buf_delete(buf, { force = false })
-- 		end
-- 	end
-- end

-- vim.api.nvim_create_user_command("BCO", close_other_buffers, { desc = "Close other buffers" })
