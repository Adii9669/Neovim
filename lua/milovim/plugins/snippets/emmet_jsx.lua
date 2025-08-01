-- lua/milovim/plugins/emmet.lua
return {
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue" },
		config = function()
			-- use <C-y>, as the “expand” trigger (you can choose any key)
			vim.g.user_emmet_leader_key = "<C-y>"
			-- only enable Emmet in those filetypes
			vim.cmd([[
        autocmd FileType html,css,javascript,typescriptreact,javascriptreact EmmetInstall
      ]])
		end,
	},
}
