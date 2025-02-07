return {
	-- LSPConfig: Sets up and configures each LSP server
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- Ensure autocompletion works
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Table of servers to be set up (adjust names as needed)
			local servers = { "clangd", "ast_grep", "pyright", "ts_ls", "lua_ls", "gopls" }

			-- Loop through each server and initialize it
			for _, server in ipairs(servers) do
				if lspconfig[server] then
					local opts = {
						on_attach = function(_, bufnr)
							local bufopts = { noremap = true, silent = true, buffer = bufnr }
							vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
							vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
							vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
							vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
						end,
						capabilities = capabilities,
					}

					-- If the server is lua_ls, configure settings so that it recognizes `vim` as a global.
					if server == "lua_ls" then
						opts.settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
							},
						}
					end

					lspconfig[server].setup(opts)
				else
					vim.notify("LSP Server " .. server .. " not found", vim.log.levels.WARN)
				end
			end
		end,
	},
}
