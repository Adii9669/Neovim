return {

	--For icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	--For Color-Scheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",

			on_color = function(color)
				color.bg = "#14161B"
			end,
		},

		config = function(_, opts)
			require("tokyonight").setup(opts)
		end,
	},

	-- TokyoDark
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
		end,
	},

	--NightFox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		opts = {},
		config = function(_, opts)
			require("nightfox").setup(opts)
		end,
	},
}
