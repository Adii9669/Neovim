return {
	"CRAG666/code_runner.nvim",
	config = true,
	config = function()
		local code_runner = require("code_runner").setup({
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = { "python3 -u" },
				typescript = { "deno run" },
			},
			vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false }),
			vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false }),
		})
	end,
}
