# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration based on [NvChad v2.5 starter](https://github.com/nvchad/starter). NvChad is loaded as a lazy.nvim plugin and provides the base UI, defaults, and many bundled plugins. All customization layers on top of it.

## Formatting

Lua files use `stylua` (configured in `.stylua.toml`):
- 2-space indent, 120-column width, Unix line endings, double quotes preferred

Run formatter: `:ConformFormat` (or `<leader>fm` via NvChad defaults)

## Architecture

### Entry point
`init.lua` bootstraps lazy.nvim, loads NvChad + local plugins, then loads `options` and `mappings`.

### Key directories
- `lua/plugins/init.lua` — all plugin declarations (additions/overrides on top of NvChad's bundled set)
- `lua/configs/` — one file per plugin for configuration
- `lua/chadrc.lua` — NvChad config struct (theme, UI); must match the shape of [nvconfig.lua](https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua)
- `lua/mappings.lua` — global keymaps only (normal, visual, etc.)

### Critical constraint: LSP keybindings
LSP keybindings (`gd`, `gr`, `gi`, `gq`) **must** be defined inside the `on_attach` callback in `lua/configs/lspconfig.lua`, not in `lua/mappings.lua`. They require `bufnr` to be buffer-local.

### Plugins added beyond NvChad defaults

| Plugin | Config file | Notes |
|---|---|---|
| `mason-lspconfig` | `configs/mason-lspconfig.lua` | Ensures `lua_ls`, `clangd`, `bashls` installed |
| `nvim-lspconfig` | `configs/lspconfig.lua` | LSP setup; `gd/gr/gi/gq` open in Telescope |
| `conform.nvim` | `configs/conform.lua` | Formatter; format-on-save is commented out |
| `nvim-treesitter` | `configs/nvim-treesitter.lua` | Ensures `lua`, `cpp` installed |
| `nvim-cmp` | `configs/nvim-cmp.lua` | Autocomplete **disabled** by default; manual trigger: `<C-s>` |
| `telescope.nvim` | `configs/telescope.lua` | Extended with `smart_history` + `ui-select`; history cycles with `<C-Up>/<C-Down>` |
| `cscope_maps.nvim` | `configs/cscope_maps.lua` | C/C++ code navigation; lazy-loaded for cpp/cfg/proto/json |
| `build_cscope.nvim` | `configs/build_cscope.lua` | Local plugin at `lua/plugins/build_cscope.nvim/`; provides `:BuildCscope` command |
| `diffview.nvim` | — | Git diff/history viewer; always loaded |

### Local plugin: build_cscope.nvim
Located at `lua/plugins/build_cscope.nvim/lua/build_cscope/init.lua`. Runs a `find` command to generate `cscope.files` (respecting `file_types` and `ignore_paths` from `configs/build_cscope.lua`), then calls `:Cs db build`. Invoked via `:BuildCscope` from the project root.

## Custom keybindings (beyond NvChad defaults)

| Key | Mode | Action |
|---|---|---|
| `;` | Normal | Enter command mode (`:`) |
| `<leader>fl` | Normal | Live grep across open buffers |
| `gd` | Normal (LSP) | Telescope LSP definitions |
| `gr` | Normal (LSP) | Telescope LSP references |
| `gi` | Normal (LSP) | Telescope LSP implementations |
| `gq` | Normal (LSP) | Telescope diagnostics (current buffer) |

## Adding a new LSP server

1. Add the server name to `ensure_installed` in `lua/configs/mason-lspconfig.lua`
2. Add configuration in `lua/configs/lspconfig.lua` using `vim.lsp.config()` + `vim.lsp.enable()`
