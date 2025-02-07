return {
	-- nvim-cmp for autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- Add LuaSnip as a source to show snippet suggestions
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},

	-- LuaSnip: Snippet engine configuration and loading snippets
	{
		"L3MON4D3/LuaSnip",
		config = function()
			-- This will load snippets in vscode format (friendly-snippets, etc.)
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- friendly-snippets: A collection of snippets for many languages, including Go
	{
		"rafamadriz/friendly-snippets",
	},
}
