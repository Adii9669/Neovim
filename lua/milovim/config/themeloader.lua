local M = {}

function M.load()
	local ok, theme = pcall(require, "milovim.config.theme")
	if ok and theme.colorscheme then
		vim.cmd.colorscheme(theme.colorscheme)
	end
end

return M
