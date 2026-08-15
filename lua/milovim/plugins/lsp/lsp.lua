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
			local globals = require("milovim.config.config_lsp")
			local lspconfig = require("lspconfig")

			local servers = {
				lua_ls = require("milovim.config.lua_ls"),
				ts_ls = require("milovim.plugins.lsp.typescript"),
				clangd = require("milovim.plugins.lsp.cpp_ls"),
			}
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),

				handlers = {
					function(server_name)
						local server_config = servers[server_name] or {}

						local final_opts = vim.tbl_deep_extend("force", {
							on_attach = globals.on_attach,
							capabilities = globals.capabilities,
						}, server_config)

						lspconfig[server_name].setup(final_opts)
					end,
				},
			})
		end,
	},
}
