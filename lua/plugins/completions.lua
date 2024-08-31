return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			'L3MON4D3/LuaSnip',
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'windwp/nvim-autopairs',
		},

		config = function()

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

		    require("luasnip.loaders.from_vscode").lazy_load()

			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)

			cmp.setup({

				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol', -- show only symbol annotations
						maxwidth = 50,
						ellipsis_char = '...',
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default
						--[[
						before = function (entry, vim_item)
	
							return vim_item
						end
						]]
					})
				},

				mapping = {

					['<CR>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-e>"] = cmp.mapping.abort(),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
				},

				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					}, {
						{ name = 'buffer' },
				})
			})
		end
	},
}
