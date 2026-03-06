vim.g.mapleader = " "
vim.g.maploaclleader = " "

-- Keybinds
vim.keymap.set("i", "<C-BS>", "<C-o>db", { noremap = true })

vim.g.have_nerd_font = true

vim.o.number = true

vim.opt.termguicolors = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.signcolumn = "yes"

vim.o.list = true
vim.opt.listchars = {
	tab = "  ",
	trail = "·",
	nbsp = "␣",
}

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Lazy from nix
if not vim.loop.fs_stat(lazypath) then
	vim.notify("lazy.nvim not found", vim.log.levels.ERROR)
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
