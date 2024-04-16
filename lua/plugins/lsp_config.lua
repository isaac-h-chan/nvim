return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright", "tsserver" }
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason-lspconfig").setup_handlers {
				function (server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {capabilities = capabilities}
				end,
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-lspconfig.nvim" },
		config = function()
			vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
		end
	}
}
