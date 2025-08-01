return {
	-- for finding_files
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"%.next/",
						"dist/",
					},
					vimgrep_arguments = vim.tbl_extend(
						"force",
						require("telescope.config").values.vimgrep_arguments,
						{ "--glob", "!**/node_modules/**" }
					),
				},
			})

			vim.keymap.set("n", "<leader>mm", builtin.find_files, {}) --for files search
			vim.keymap.set("n", "<leader>pg", builtin.live_grep, {}) --for grep the files
			vim.keymap.set("n", "<leader>bb", builtin.buffers, {}) --for buffer search
			vim.keymap.set("n", "<leader>hh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>.", builtin.diagnostics, { desc = "Telescope: Workspace Diagnostics" })

			vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float, { desc = "Show Diagnostic at Cursor" })
			vim.keymap.set("n", "<C-e>", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
			-- Diagnostic navigation
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

			-- Optional: Telescope
			vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope Diagnostics" })
		end,
	},

	---for directories
	{

		"princejoogie/dir-telescope.nvim",
		-- telescope.nvim is a required dependency
		dependency = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			-- vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>nn", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

			require("dir-telescope").setup({
				-- these are the default options set
				hidden = true,
				no_ignore = false,
				show_preview = true,
			})
		end,
	},
}
