return {

	-- TokyoNight is your primary, high-priority theme
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure it loads first
		lazy = false, -- Load on startup
		opts = {
			style = "storm",
			transparent = true,
		},
		-- Your custom init function to load a theme from your config
		init = function()
			local ok, theme = pcall(require, "milovim.config.theme")
			if ok and theme.colorscheme then
				vim.cmd.colorscheme(theme.colorscheme)
			else
				vim.cmd.colorscheme("carbonfox") -- Fallback if your config fails
			end
		end,
	},
	-- Devicons is a separate plugin, often a dependency for UI plugins
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	--Themes
	{ "tiagovla/tokyodark.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "EdenEast/nightfox.nvim" },
}
