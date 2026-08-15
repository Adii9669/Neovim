return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	-- enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		{ "<leader>o", ":Neotree focus<CR>", { desc = "Focus Neo-tree" } },
	},
	config = function()
		require("neo-tree").setup({
			filters = {
				-- dotfiles = true,
			},

			filesystem = {
				filtered_items = {
					visible = false,
				},
			},

			window = {
				position = "left",
			},

			default_component_configs = {
				git_status = {
					symbols = {
						added = "✚",
						modified = "●",
						deleted = "✖",
						renamed = "➜",
						untracked = "?",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},

				diagnostics = {
					symbols = {
						hint = "󰌶",
						info = "󰋽",
						warn = "󰀪",
						error = "󰅚",
					},
				},
			},
		})
	end,
}
