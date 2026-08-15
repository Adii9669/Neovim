local M = {}
local opts = {}

-- Shared on_attach: maps <C-.>, [d, ]d for *every* LSP you spin up
M.on_attach = function(client, bufnr)
	print("LSP attached: " .. client.name) -- A handy message to confirm attachment

	-- locals for typescript
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = "LSP: " .. desc })
	end

	-- Add all your desired keymaps here
	map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
	map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
	map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
	map("n", "gr", vim.lsp.buf.references, "Go to References")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
	-- map("n", "[d", vim.diagnostic.jump({ count = 1 }), "Previous Diagnostic")
	-- map("n", "]d", vim.diagnostic.jump({ count = -1 }), "Next Diagnostic")
	map("n", "[d", function()
		vim.diagnostic.jump({ count = -1 })
	end, "Previous Diagnostic")
	map("n", "]d", function()
		vim.diagnostic.jump({ count = 1 })
	end, "Next Diagnostic")

	--other diagnostic
	vim.keymap.set("n", "<C-.>", vim.diagnostic.open_float, opts)
	-- vim.keymap.set("n", "[d", vim.diagnostic.jump({ count = -1 }), opts)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	--for the current line diagnostic Copy the error to the clipboard
	vim.keymap.set("n", "<C-,>", function()
		local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
		if vim.tbl_isempty(diagnostics) then
			vim.notify("No diagnostics on this line", vim.log.levels.INFO)
			return
		end
		local message = diagnostics[1].message
		vim.fn.setreg("+", message)
		vim.notify("Copied diagnostic to clipboard: " .. message, vim.log.levels.INFO)
	end, opts)
end

-- If you’re using nvim-cmp, also expose these capabilities:
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
