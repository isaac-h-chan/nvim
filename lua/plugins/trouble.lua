return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		vim.keymap.set("n", "<leader>df", function() require("trouble").toggle() end)
		vim.keymap.set("n", "<leader>dw", function() require("trouble").toggle("workspace_diagnostics") end)
		vim.keymap.set("n", "<leader>dd", function() require("trouble").toggle("document_diagnostics") end)
		vim.keymap.set("n", "<leader>dq", function() require("trouble").toggle("quickfix") end)
		vim.keymap.set("n", "<leader>dl", function() require("trouble").toggle("loclist") end)
		vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
	end,
}
