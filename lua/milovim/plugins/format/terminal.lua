return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15, -- Adjust height for bottom terminal
			open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl+\
			shade_terminals = true,
			direction = "horizontal", -- Options: 'horizontal', 'vertical', 'float', 'tab'
			persist_size = true,
			start_in_insert = true,
			close_on_exit = true,
			shell = vim.o.shell, -- Uses the default shell
		})
	end,
}
