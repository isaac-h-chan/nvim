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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- mason-lspconfig v2: configure servers via native vim.lsp.config,
			-- then let mason-lspconfig auto-enable installed ones.
			vim.lsp.config("*", { capabilities = capabilities })
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--header-insertion=never",
					-- let clangd extract system includes from the cross compilers
					"--query-driver=**/arm-none-eabi-g*,**/aarch64-*-g*,**/aarch64-linux-g*",
				},
				root_markers = { "compile_commands.json", ".git" },
			})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright" },
				automatic_enable = true,
			})
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

			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
		end
	}
}
