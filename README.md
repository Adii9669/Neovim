# Neovim Setup with Lazy.nvim

So first Thing you need to know is the Structured way for setting up the Neovim 

This guide will help you set up Neovim using the `lazy.nvim` plugin manager in a structured manner.


## Structure
Below is the recommended directory structure for organizing your Neovim configuration files:

```nvim
    ├── init.lua
    ├── lazy-lock.json
    └── lua
        └── [YourFolderName] eg milovim
            ├── lazy.lua  
            ├── option.lua
            ├── plugins
            │   ├── telescope.lua (eg)
            │   └── trouble.lua
            ├── remap.lua
            └── set.lua

```
## Step-by-Step Setup

### 1. Create the Neovim Config Directory
If the `.config/nvim` directory doesn't already exist, create it:

```bash/zsh
mkdir -p ~/.config/nvim
cd ~/.config/nvim
```


Inside the ``~/.config/nvim`` directory, create a file named ``init.lua``

```zsh/bash
touch init.lua
```

### 2.Add this Following line in ``init.lua``
```bash
require("yourfoldername.lazy")
```

### 3.Create a Folder in ``.config/nvim/lua``
  Inside lua create one more folder with you custom Name.
```bash
mkdir lua
cd lua
mkdir CustomName
```
 Create a Folder in ```.config/nvim/lua/plugins```
```bash
mkdir plugins
```

 Create a File in ```.config/nvim/lua/```
```bash
touch lazy.lua
```

 Create a File in ```.config/nvim/lua/```
```bash
touch remap.lua
```

 Create a File in ```.config/nvim/lua/```
```bash
touch set.lua
```






##  Plugins Installation


### 1. Copy the following in  Lazy.lua 
```bash
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "milovim.plugins"  },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
})
```

### 2.Copy the following in ```.config/nvim/lua/plugins/mason.lua``` 
Create a file in plugins Folder ``mason.lua``

```
         ├── plugins
                ├── mason.lua 
                └── trouble.lua
```
## Mason.lua
```bash 
  return {
  {
    "williamboman/mason.nvim",
    config = ture,

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local mason = require("mason")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end
  },

}
```

## AutoPairs
```bash
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt", "vim" },
        })
    end,
}
```

## Cmp-auto
 For auto-completion
 ```bash
 return{
  --nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' }
        }
      })
    end
  },

}
```


## colorscheme
```bash
return {

 --For Color-Scheme 
 {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},

  config = function() 
   vim.cmd([[colorscheme tokyonight-night]])  
  end,
  },


  {
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},


  --For icons 
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
```
## Telescope
```bash
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
	end,
}
```


## Directory - Telescope
```bash
return {
	"princejoogie/dir-telescope.nvim",
	-- telescope.nvim is a required dependency
	dependency = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

		require("dir-telescope").setup({
			-- these are the default options set
			hidden = true,
			no_ignore = false,
			show_preview = true,
		})
	end,
}
```


## Formatter
```bash
return {

	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},

			{
				vim.keymap.set({ "n", "v" }, "<leader>ff", function()
					conform.format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 500,
					})
				end, { desc = "Format file or range (in visual mode)" }),
			},
		})
	end,
}
```


## Lintting 
```bash
return {

	"mfussenegger/nvim-lint",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
```

## Lsp-config

```bash
return {
  --LSPConfig: Integrates Mason with nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "ts_ls", "lua_ls" }, -- Add the LSPs you need
        automatic_installation = true,
      })
    end
  },

  -- LSPConfig: Basic LSP setup for Neovim
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Default LSP mappings and settings
      local lspconfig = require("lspconfig")

      -- List of servers to setup
      local servers = { "clangd",  "ast_grep","pyright", "ts_ls", "lua_ls" } -- Add or modify the servers you want

      -- Loop through the servers and set them up
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          on_attach = function(_, bufnr)
            -- Example key mappings
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
          end,
          capabilities = require('cmp_nvim_lsp').default_capabilities()
        })
      end
    end
  },


}
```

## Nvim-tree
```bash
return {
  "nvim-neo-tree/neo-tree.nvim",
   branch = "v3.x",

    dependencies ={
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
  keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
}
```

## Nvim-treesitter
```bash
return {
	--For better  highlighting

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },

			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
```



## keymaps
```bash
local opt = { noremap = true, silent = true }
local keymap = vim.keymap.set

--for loacating directories
keymap("n", "<leader>pv", "<cmd>Ex<cr>")

--Exit insert mode
keymap("i", "jj", "<ESC>")

--For quit and save the files
keymap("n", "<leader>w", "<cmd>w<cr>")
keymap("n", "<leader>q", "<cmd>q<cr>")
keymap("n", "<leader>s", "<cmd>wq<cr>")

--For Changing buffer present
keymap("n", "<C-i>", "<cmd>bprev<cr>")
keymap("n", "<C-o>", "<cmd>bnext<cr>")

--For lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>")

--source
keymap("n", "<leader>so", ":w<CR>:so %<CR>")

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-j>", "<C-w>j")

-- Resize Windows
keymap("n", "<C-Left>", "<C-w><")
keymap("n", "<C-Right>", "<C-w>>")
keymap("n", "<C-Up>", "<C-w>+")
keymap("n", "<C-Down>", "<C-w>-")

-- New Windows
keymap("n", "<leader>h", "<CMD>vsplit<CR>")
keymap("n", "<leader>v", "<CMD>split<CR>")

-- Switch between tabs
keymap("n", "<leader>tt", ":tabnext<CR>", opt) -- Next tab
keymap("n", "<leader>tp", ":tabprevious<CR>", opt) -- Previous tab

-- Go to specific tab
keymap("n", "<leader>1", "1gt", opt) -- Go to first tab
keymap("n", "<leader>2", "2gt", opt) -- Go to second tab
keymap("n", "<leader>3", "3gt", opt) -- Go to third tab

-- Open and close tabs
keymap("n", "<leader>tn", ":tabnew<CR>", opt) -- Open a new tab
keymap("n", "<leader>tr", ":tabclose<CR>", opt) -- Close the current tab

--Mason
keymap("n", "<leader>ms", "<cmd>:Mason<cr>", opt)
```

## Set
```bash
local global = vim.g
local o = vim.opt

-- Editor options

o.number = true -- Print the line number in front of each line
o.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
o.encoding = "UTF-8" -- Sets the character encoding used inside Vim.
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.splitright = true
o.splitbelow = true -- When on, splitting a window will put the new window below the current one
o.termguicolors = true
```
