return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			options = {
				theme = "palenight",
				globalstatus = true,

				component_separators = "",
				section_separators = "",
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },

				lualine_c = {
					{
						"filename",
						path = 1, -- full absolute path
						color = { fg = "#00ffff", gui = "bold" }, -- optional styling
					},
				},

				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
}
