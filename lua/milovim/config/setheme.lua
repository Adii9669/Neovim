vim.api.nvim_create_user_command("SetTheme", function(args)
	-- Get the theme name the user typed after the command (e.g., "kanagawa")
	local theme_name = args.fargs[1]

	-- Find the exact path to your theme configuration file
	local config_path = vim.fn.stdpath("config") .. "/lua/milovim/config/theme.lua"

	-- Prepare the text that will be saved to the file
	-- For example: 'return { colorscheme = "kanagawa" }'
	local new_content = string.format('return { colorscheme = "%s" }', theme_name)

	-- Open the config file in "write" mode (which erases the old content)
	local file = io.open(config_path, "w")
	if not file then
		-- Show an error if the file couldn't be opened for some reason
		print("Error: Could not open theme config file at: " .. config_path)
		return
	end

	-- Write the new text and close the file
	file:write(new_content)
	file:close()

	-- IMPORTANT: Apply the colorscheme to the current session right now
	vim.cmd.colorscheme(theme_name)

	-- Give the user a confirmation message
	print("Theme set to '" .. theme_name .. "' and saved as the new default.")
end, {
	nargs = 1, -- The command requires exactly one argument (the theme name).
	complete = "color", -- This gives you Tab-completion for all installed themes!
})
