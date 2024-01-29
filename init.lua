vim.g.mapleader = "<Space>"
vim.g.maplocalleader = "<Space>"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
	"folke/which-key.nvim",
	{ 
		"folke/neoconf.nvim", cmd = "Neoconf" 
	},
  	"folke/neodev.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
			})
		end,
		priority = 1000
	},
})

vim.cmd.colorscheme "catppuccin"
