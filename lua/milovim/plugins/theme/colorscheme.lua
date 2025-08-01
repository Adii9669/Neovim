return {

	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		style = "storm",
		transparent = true,

		--For icons
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	init = function()
		local ok, theme = pcall(require, "milovim.config.theme")
		if ok and theme.colorscheme then
			vim.cmd.colorscheme(theme.colorscheme)
		else
			vim.cmd.colorscheme("tokyonight") -- fallback
		end
	end,

	--Themes
	{ "tiagovla/tokyodark.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "EdenEast/nightfox.nvim" },
}
