local M = {}

-- Shared on_attach: maps <C-.>, [d, ]d for *every* LSP you spin up
M.on_attach = function(client, bufnr)
	-- locals for typescript
	local bufmap = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	--other diagnostic
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<C-.>", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	--for the current line diagnostic
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
