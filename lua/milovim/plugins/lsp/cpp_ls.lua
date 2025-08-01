-- * Locals of this area * --
--the local variable for using lspconfig(for configuring env and lsp)
local globals = require("milovim.config.lsp")
-- local util = lspconfig.util

return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			clangd = {
				cmd = { "clangd", "--background-index", "--clang-tidy" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
			},
		},
	},

	-- * Calling the globals helpers --
	-- * the Police department help --
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
