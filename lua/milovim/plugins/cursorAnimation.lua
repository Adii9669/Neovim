return {
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_between_buffers = true,
			smear_between_neighbor_lines = true,
			legacy_computing_symbols_support = false,

			-- Animation tuning
			stiffness = 0.8,
			trailing_stiffness = 0.5,
			distance_stop_animating = 0.5,
			time_interval = 17, -- ~60fps
		},
	},
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = {
			cursor = {
				enable = true,
				timing = function(_, n)
					return math.min(150, n * 5)
				end,
			},
			scroll = { enable = false }, -- keep Hyprland scrolling
		},
	},
}
