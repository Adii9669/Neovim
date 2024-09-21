# Neovim Setup with Lazy.nvim
Setup Lazy Neovim

So first Thing you need to know is the Structured way for setting up the Neovim 

This guide will help you set up Neovim using the `lazy.nvim` plugin manager in a structured manner.

## Neovim Directory Structure

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


Inside the ~/.config/nvim directory, create a file named init.lua:

```zsh/bash
touch init.lua
```

### 2.Add this Following line in init.lua.
  Add the following content to init.lua:
```
require("yourfoldername.lazy")
```

### 3.Create a Folder in .config/nvim/lua
 Inside lua create one more folder with you custom Name.
```zsh/bash
mkdir lua
cd lua
mkdir cutomname
```

### 4.Create a File in ```.config/nvim/lua/yourfoldername/lazy.lua```

```bash/zsh
touch lazy.lua
```

### 5. Copy the following in  Lazy.lua 
```
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
### 6. Create a folder plugins 
Plugins for Nvim

Mason Nvim for installing the Lsp servers, formatter, Lintter.
```
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

