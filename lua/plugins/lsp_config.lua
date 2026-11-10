return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
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
			-- Use nvim 0.11+ built-in LSP defaults:
			--   grr references, gri implementation, grn rename, gra code action,
			--   grt type definition, grx codelens, gO doc symbols, K hover,
			--   [d ]d diagnostics, CTRL-S signature help (insert)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
		end
	}
}
