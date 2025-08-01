return {
	-- LuaSnip: Snippet engine configuration and loading snippets
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" }, -- Ensure friendly snippets are loaded
	opts = {
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
	},
	config = function(_, opts)
		local luasnip = require("luasnip")

		-- Apply LuaSnip options
		luasnip.config.set_config(opts)

		-- Load VSCode-style snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Manually set JavaScript snippets to work in JSX/TSX files
		luasnip.filetype_extend("javascriptreact", { "javascript" })
		luasnip.filetype_extend("typescriptreact", { "javascript" })
	end,
}
