return {
	-- for finding_files
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local function project_root()
				local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
				if vim.v.shell_error == 0 and git_root and git_root ~= "" then
					return git_root
				else
					return vim.loop.cwd()
				end
			end
			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"%.next/",
						"dist/",
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!**/.git/**",
						"--glob",
						"!**/node_modules/**",
					},
				},
			})
			-- 🔎 Live grep from project root
			vim.keymap.set("n", "<leader>kk", function()
				builtin.live_grep({ cwd = project_root() })
			end, { desc = "Live Grep (project root)" })
			vim.keymap.set("n", "<leader>mm", function()
				builtin.find_files({ cwd = vim.fn.getcwd() })
			end, { desc = "Find Files (cwd)" })
			vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>hh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>.", builtin.diagnostics, { desc = "Telescope: Workspace Diagnostics" })
			vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
			vim.keymap.set("n", "<leader>dj", vim.diagnostic.setqflist, { desc = "List Diagnostics" })
			vim.keymap.set("n", "<C-e>", vim.lsp.buf.hover, { desc = "LSP Hover Documentation" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
			vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope Diagnostics" })
		end,
	},
	---for directories
	{
		"princejoogie/dir-telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>nn", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
			require("dir-telescope").setup({
				hidden = true,
				no_ignore = false,
				show_preview = true,
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
