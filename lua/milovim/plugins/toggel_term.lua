return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			close_on_exit = false,
			shade_terminals = true,
		})

		-- F5 to compile + run C++
		vim.keymap.set("n", "<F5>", function()
			local file = vim.fn.expand("%:p") -- full path
			local out = vim.fn.expand("%:p:r") -- path without .cpp

			vim.cmd("write") -- save file

			local cmd = string.format('g++ -std=c++17 "%s" -o "%s" && "%s"', file, out, out)

			require("toggleterm").exec(cmd, 1)
		end, { desc = "Run C++ file" })
	end,
}
