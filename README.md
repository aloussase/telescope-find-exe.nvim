# Telescope-find-exe.nvim

Find executable files in the current working directory (or others).

## Installation

### lazy.nvim

```lua
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "aloussase/telescope-find-exe.nvim" },
  }
}
```

## Setup 

```lua
require('telescope').load_extension('find_exe')
```

## Options

You can choose in which directory to search:

```vim
Telescope find_exe dir=./build
```

You can also use the `execute` flag to run the executable in a floating winow:

```vim
Telescope find_exe dir=./build execute=true
```
