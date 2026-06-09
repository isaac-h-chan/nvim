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
vim.opt.updatetime = 250
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.pumheight = 8
vim.opt.winborder = "rounded"
vim.opt.undofile = true
vim.opt.swapfile = false
-- vim.diagnostic.config( { virtual_text=false, underline=true})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set('n', "<leader>q", ":q!")

-- treesitter 
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- Safely start native treesitter if a parser is available
    pcall(vim.treesitter.start)
  end,
})

-- Incremental node selection (native nvim 0.12, treesitter + LSP fallback)
local function ts_select(dir)
	return function()
		if vim.treesitter.get_parser(nil, nil, { error = false }) then
			require("vim.treesitter._select")[dir == 1 and "select_parent" or "select_child"](vim.v.count1)
		else
			vim.lsp.buf.selection_range(dir * vim.v.count1)
		end
	end
end
vim.keymap.set("x", "n", ts_select(1), { desc = "Expand selection" })
vim.keymap.set("x", "m", ts_select(-1), { desc = "Shrink selection" })
vim.keymap.set("n", "<CR>", function()
	vim.cmd("normal! v")
	ts_select(1)()
end, { desc = "Start node selection" })

-- Configure scroll distance to 1/3 of window height
local function set_scroll_distance()
	local height = vim.fn.winheight(0)
	vim.wo.scroll = math.floor(height / 3)
end

vim.api.nvim_create_augroup("scroll_config", { clear = true })
vim.api.nvim_create_autocmd({ "VimResized", "WinEnter" }, {
	group = "scroll_config",
	callback = set_scroll_distance,
})

-- Set initial scroll distance
set_scroll_distance()
--[[
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})
]]
require("lazy").setup("plugins")
