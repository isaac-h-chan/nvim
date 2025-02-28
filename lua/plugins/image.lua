return {
	"3rd/image.nvim",
	build = false,
	opts = {},

	config = function()
		require("image").setup({
			processor = "magick_cli",
			max_width = 100, -- tweak to preference
			max_height = 12, -- ^		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" }
			max_height_window_percentage = math.huge, -- this is necessary for a good experience
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
		})
	end
}
