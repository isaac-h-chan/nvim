-- Native nvim 0.12 treesitter: highlighting is started by the FileType autocmd
-- in init.lua (vim.treesitter.start). This plugin only manages parsers + their
-- highlight queries (the deprecated nvim-treesitter is intentionally not used).
return {
  "romus204/tree-sitter-manager.nvim",
  branch = "main",
  lazy = false,
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      -- defaults already point at site/parser and site/queries
      ensure_installed = {
        "c", "cpp", "python", "bash", "lua",
        "markdown", "markdown_inline", "json", "yaml",
        "javascript", "typescript", "starlark", -- starlark = .bzl/BUILD
      },
      auto_install = true,
      noauto_install = { "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
    })
  end,
}
