return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")

		-- Example: Lua
		lspconfig.lua_ls.setup(require("milovim.plugins.lsp.lua_ls"))

		-- Example: TypeScript
		lspconfig.ts_ls.setup(require("milovim.plugins.lsp.typescript"))

		-- Example: Clangd (C/C++)
		lspconfig.clangd.setup(require("milovim.plugins.lsp.cpp_ls"))

		-- Python (pyright)
		lspconfig.pyright.setup(require("milovim.plugins.lsp.python"))

		-- Ruff (Python linter)
		lspconfig.ruff.setup({}) -- or load config file if needed
	end,
}
