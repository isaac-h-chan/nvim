-- Uses Claude Code via ACP (Claude subscription, no API key).
-- Setup:
--   npm i -g @zed-industries/claude-agent-acp
--   claude setup-token   -> export CLAUDE_CODE_OAUTH_TOKEN=<token> in ~/.zshrc
return {
	"olimorris/codecompanion.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		display = {
			chat = {
				window = { layout = "vertical", position = "right" },
			},
		},
		interactions = {
			chat = { adapter = "claude_code" },
			inline = { adapter = "claude_code" },
		},
	},
	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", mode = { "n", "v" }, desc = "CodeCompanion chat" },
		{ "<leader>cp", "<cmd>CodeCompanionActions<CR>", mode = { "n", "v" }, desc = "CodeCompanion actions" },
		{ "ga", "<cmd>CodeCompanionChat Add<CR>", mode = "v", desc = "Add selection to chat" },
	},
}
