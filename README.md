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

###2.
Add the following content to init.lua:

require("yourfoldername.lazy")
require("yourfoldername.remap")
require("yourfoldername.set")



