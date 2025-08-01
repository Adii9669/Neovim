-- * Locals of this area * --
--the local variable for using lspconfig(for configuring env and lsp)
local globals = require("milovim.config.lsp")

-- typescript-tools plugin config
return {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	config = function()
		require("typescript-tools").setup({
			on_attach = globals.on_attach,
			capabilities = globals.capabilities,
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave", -- Or "change"
				expose_as_code_action = "all",
				tsserver_plugins = {},
			},
		})
	end,
}
