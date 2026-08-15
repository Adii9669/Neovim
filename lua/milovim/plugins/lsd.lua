return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			require("milovim.config.lsp").setup()
		end,
	},
}
