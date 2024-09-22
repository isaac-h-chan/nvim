return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>dd",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>df",
      "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>ds",
      "<cmd>Trouble symbols toggle focus=true<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>dl",
      "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>dL",
      "<cmd>Trouble loclist toggle focus=true<cr>",
     desc = "Location List (Trouble)",
    },
    {
      "<leader>dq",
      "<cmd>Trouble qflist toggle focus=true<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}

--[[
	{
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
	]]--

