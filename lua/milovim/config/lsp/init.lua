local M = {}

function M.setup()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	local common = require("milovim.config.lsp.common")

	local servers = {
		lua_ls = require("milovim.config.lsp.servers.lua_ls"),
		ts_ls = require("milovim.config.lsp.servers.typescript"),
		clangd = require("milovim.config.lsp.servers.cpp_ls"),
		qmlls = require("milovim.config.lsp.servers.qmlls"),
	}

	mason.setup()

	mason_lspconfig.setup({
		ensure_installed = {
			"lua_ls",
			"ts_ls",
			"clangd",
		},
	})

	for server_name, server_config in pairs(servers) do
		local opts = vim.tbl_deep_extend("force", {
			on_attach = common.on_attach,
			capabilities = common.capabilities,
		}, server_config)

		vim.lsp.config(server_name, opts)
		vim.lsp.enable(server_name)
	end
end

return M
