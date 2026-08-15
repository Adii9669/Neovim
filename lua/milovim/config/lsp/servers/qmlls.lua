return {
	cmd = { "qmlls6" },

	filetypes = {
		"qml",
	},

	root_dir = function(bufnr)
		return vim.fs.root(bufnr, {
			"qmlls.ini",
			"CMakeLists.txt",
			".git",
		})
	end,
}
