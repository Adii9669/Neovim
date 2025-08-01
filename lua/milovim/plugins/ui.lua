return {
	--tabs
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- or "tabs"
					numbers = "none",
					diagnostics = "nvim_lsp",
					show_buffer_close_icons = true,
					show_close_icon = false,
					separator_style = "slant",
					offsets = {
						{
							filetype = "neo-tree", -- or "NvimTree" if you use that
							text = "",
							highlight = "",
							text_align = "center",
						},
					},
				},
			})

			-- Optional keymaps
			vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
			vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
			vim.keymap.set("n", "<C-k>", "<cmd>bd<CR>", { desc = "Close buffer" })
		end,
	},
}
