return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({ ensure_installed = { "c", "lua", "python", "javascript", "html", "prisma", "terraform", "markdown", "vim", "vimdoc"},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = "gnn",
					node_incremental = "n",
					-- scope_incremental = "grc",
					node_decremental = "m",
				}
			},
		})
	end,
}
