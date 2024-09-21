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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Neovim Setup Guide</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            background-color: #f4f4f4;
        }
        pre, code {
            background-color: #333;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
        pre {
            margin-bottom: 20px;
        }
        h1, h3 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding-left: 0;
        }
        ul li {
            background-color: #eee;
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <h1>Neovim</h1>
    <h3>Setup Lazy Neovim</h3>
    <p>First, let's understand the structured way for setting up Neovim:</p>

    <pre><code>
nvim
├── init.lua
├── lazy-lock.json
└── lua
    └── [YourFolderName] eg milovim
        ├── lazy.lua  
        ├── option.lua
        ├── plugins
        │   ├── telescope.lua (eg)
        │   └── trouble.lua
        ├── remap.lua
        └── set.lua
    </code></pre>

    <ul>
        <li>
            <strong>Create a Folder:</strong> If the <code>.config/nvim</code> directory doesn't already exist, create it. Navigate to it using:
            <pre><code>cd ~/.config</code></pre>
        </li>
        <li>
            <strong>Create the <code>init.lua</code> file:</strong> Inside <code>.config/nvim</code>, create a new file named <code>init.lua</code>:
            <pre><code>touch init.lua</code></pre>
            This <code>init.lua</code> file will initialize your setup. Add the following content:
            <pre><code>
require("foldername.lazy")
require("foldername.remap")
require("foldername.set")
            </code></pre>
        </li>
        <li>
            <strong>Create the Lua Directory:</strong> In the <code>.config/nvim</code> directory, create a folder named <code>lua</code>:
            <pre><code>mkdir -p ~/.config/nvim/lua/yourfoldername</code></pre>
        </li>
        <li>
            <strong>Create the <code>lazy.lua</code> File:</strong> Inside <code>.config/nvim/lua/yourfoldername</code>, create a file named <code>lazy.lua</code>:
            <pre><code>touch ~/.config/nvim/lua/yourfoldername/lazy.lua</code></pre>
            Copy the following Lazy.nvim setup code into <code>lazy.lua</code>:
            <pre><code>
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
    { import = "yourfoldername.plugins"  },
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
            </code></pre>
        </li>
    </ul>

</body>
</html>



