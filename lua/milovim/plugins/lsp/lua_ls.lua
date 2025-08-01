-- * Locals of this area * --
--the local variable for using lspconfig(for configuring env and lsp)
local globals = require("milovim.config.lsp")

return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false, -- optional, disables popup suggestions
			},
			telemetry = {
				enable = false, -- disable telemetry
			},
		},
	},

	-- * Calling the globals helpers --
	-- * the Police department help --
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
