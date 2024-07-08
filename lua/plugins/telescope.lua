return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
			vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
			vim.keymap.set('n', "<leader>gs", builtin.git_status, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	}
}
