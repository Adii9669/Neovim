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

```init.lua``` --This is the file where you use the file and folder to initate

This is the inside of the init.lua
``
require("foldername.lazy")
require("foldername.remap")
require("foldername.set")
``


``lua`` -- Folder For plugins and custom files 

