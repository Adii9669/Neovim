return {
	-- Mason: Manages LSP installations
	{
		"williamboman/mason.nvim",

		build = ":MasonUpdate",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	-- Mason-LSPConfig: Bridges Mason and LSPConfig
	{
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ts_ls",
					"ruff",
					"lua_ls",
					"pylsp",
					"clangd",
					"gopls",
				},
				-- automatic_installation = true,
			})
		end,
	},

	-- Mason Tool:
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		confing = function()
			local mason_tool_installer = require("")

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint",
					"eslint_d",
				},
			})
		end,
	},
}
