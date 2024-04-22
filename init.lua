# "eagerly" disable netrw as recommended by nvim-tree.lua 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set rnu")
vim.cmd("set nu")
vim.cmd("set ruler")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

vim.g.have_nerd_font = true
vim.o.updatetime = 250
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.pumheight = 8
-- vim.diagnostic.config( { virtual_text=false, underline=true})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set('n', "<leader>q", ":q!")
--[[
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})
]]
require("lazy").setup("plugins")
