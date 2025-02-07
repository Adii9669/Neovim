return {
	"CRAG666/code_runner.nvim",
	config = function()
		-- Set up code_runner with filetype-specific commands
		require("code_runner").setup({
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = { "python3 -u" },
				typescript = { "deno run" },
			},
		})

		-- Set key mappings separately, outside the setup() table
		vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
	end,
}
