return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure()
		local highlights = {
			IlluminatedWord = { underline=true, bold=true, fg="#fabd2f", bg="#3c3836" },
			IlluminatedWordText = { underline=true, bold=true, fg="#fabd2f", bg="#3c3836" },
			IlluminatedWordRead = { underline=true, bold=true, fg="#fabd2f", bg="#3c3836" },
			IlluminatedWordWrite = { underline=true, bold=true, fg="#fe8019", bg="#3c3836" },
		}
		for group, value in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, value)
		end
	end
}
