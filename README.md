# Neovim
Setup Lazy Neovim

So first Thing you need to know is the Structured way for setting up the Neovim 

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

1. Create a folder in ```.config/nivm``` or if already their
```cd .config```

2. Create a file ```touch init.lua```
   
```init.lua``` --This is the file where you use the file and folder to initate

This is the inside of the init.lua 
```lua
require("foldername.lazy")
require("foldername.remap")
require("foldername.set")
```

3. Create a folder ```lua```
 Inside the lua create a folder with yourcustom name .config/nvim/lua/yourfoldername

3. Create a folder
   ```lua```
4. Create a File  in .config/nvim/lua/yourfoldername/lazy.lua
   ```lazy.lua```
   Inside lazy.lua copy this for lazySetup
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
    { import = "foldername.plugins"  },
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



