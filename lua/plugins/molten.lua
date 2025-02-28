return {
    "benlubas/molten-nvim",
	dependencies = { "3rd/image.nvim" },
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
        -- this is an example, not a default. Please see the readme for more configuration options
        -- vim.g.molten_output_win_max_height = 12
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_output_win_max_height = 20
		vim.g.molten_virt_text_output = true
		vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
			{ silent = true, desc = "Initialize the plugin" })
		vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>",
			{ silent = true, desc = "run operator selection" })
		vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>",
			{ silent = true, desc = "evaluate line" })
		vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>",
			{ silent = true, desc = "re-evaluate cell" })
		vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv",
			{ silent = true, desc = "evaluate visual selection" })
		vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>",
			{ silent = true, desc = "show/enter output" })
    end,
}
