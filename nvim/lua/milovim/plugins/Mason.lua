return {

	{
		"williamboman/mason.nvim",
		config = true,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
}
