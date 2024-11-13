This repo contains my neovim configuration.

- This is based on NvChad starter (https://github.com/nvchad/starter). So, it'll
  bring in NvChad as a plugin on first run.

## Installation
Simply clone this repo to you nvim config directory.

For eg.
```bash
cd ~/.config/nvim
git clone git@github.com:anirudhaku/nvim_config.git .
```

## Features
* All NvChad built-in features.
* Additional plugins:
    * cscope_maps.nvim (https://github.com/dhananjaylatkar/cscope_maps.nvim)
    * build_cscope.nvim - Custom plugin to help build cscope database.
    * diffview.nvim (https://github.com/sindrets/diffview.nvim)
    * copilot.vim (https://github.com/github/copilot.vim)
    * CopilotChat.nvim (https://github.com/CopilotC-Nvim/CopilotChat.nvim)
* Config overrides for a bunch of plugins to my liking.
* Custom LSP keybindings to use telescope instead of default quickfix list.
  See lua/configs/lspconfig.lua for full list.
