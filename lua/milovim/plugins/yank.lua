return {
	"maxbrunsfeld/vim-yankstack",
	config = function()
		vim.g.yankstack_map_keys = 0 -- enable default keymaps
		-- Custom leader mappings
		vim.keymap.set("n", "<leader>yo", "<Plug>yankstack_substitute_older_paste", { desc = "Yankstack older paste" })
		vim.keymap.set("n", "<leader>yn", "<Plug>yankstack_substitute_newer_paste", { desc = "Yankstack newer paste" })
	end,
}
