-- treesitter-based folding, functions only (zM = collapse all, zR = open all)
local function fold_funcs_only()
	local pos = vim.v.lnum - 1
	local ok, parser = pcall(vim.treesitter.get_parser, nil, nil, { error = false })
	if not ok or not parser then
		return "0"
	end
	parser:parse()
	local node = parser:named_node_for_range({ pos, 0, pos, 0 }, { error = false })
	while node do
		local t = node:type()
		if t:match("function") or t:match("method") then
			local srow, _, erow = node:range()
			if srow == pos then
				return ">1"
			elseif erow == pos then
				return "<1"
			else
				return "1"
			end
		end
		node = node:parent()
	end
	return "0"
end
_G.fold_funcs_only = fold_funcs_only

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.fold_funcs_only()"
vim.opt.foldlevel = 99       -- start fully open
vim.opt.foldlevelstart = 99
