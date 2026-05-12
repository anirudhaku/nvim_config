This repo contains my neovim configuration.

- Based on [NvChad v2.5 starter](https://github.com/nvchad/starter). NvChad is
  pulled in as a lazy.nvim plugin on first run and provides the base UI,
  defaults, and many bundled plugins. All customization layers on top of it.

## Installation

Clone this repo into your nvim config directory:

```bash
git clone git@github.com:anirudhaku/nvim_config.git ~/.config/nvim
```

On first launch, lazy.nvim will bootstrap itself and install all plugins
(including NvChad). Mason will then install the configured LSP servers
(`lua_ls`, `clangd`, `bashls`) and auto-install `tree-sitter-cli` if missing.

## Plugins (beyond NvChad defaults)

| Plugin | Purpose |
|---|---|
| `mason-lspconfig.nvim` | Ensures LSP servers are auto-installed via Mason |
| `nvim-lspconfig` | LSP setup; `gd/gr/gi/gq` open results in Telescope |
| `conform.nvim` | Formatter (stylua, clang-format); format-on-save off by default |
| `nvim-treesitter` | Syntax/indent; ensures `lua` and `cpp` parsers installed |
| `nvim-cmp` | Autocomplete, disabled by default; manual trigger: `<C-s>` |
| `telescope.nvim` | Extended with `smart_history` + `ui-select`; history: `<C-Up>/<C-Down>` |
| `cscope_maps.nvim` | C/C++ code navigation; lazy-loaded for cpp/cfg/proto/json files |
| `build_cscope.nvim` | Local plugin; provides `:BuildCscope` to regenerate cscope database |
| `diffview.nvim` | Git diff and file history viewer |
| `zoom.nvim` | Toggle zoom/maximize for current window |
| `nvim-autopairs` | **Disabled** |

## LSP servers

Configured in `lua/configs/lspconfig.lua`:

| Server | Languages |
|---|---|
| `lua_ls` | Lua |
| `clangd` | C/C++ (runs with `-j=2`) |
| `bashls` | Bash/shell |

All LSP results (`gd`, `gr`, `gi`, `gq`) open in Telescope instead of the
default quickfix list.

## Keybindings

Custom bindings on top of NvChad defaults:

| Key | Mode | Action | Defined In |
|---|---|---|---|
| `;` | Normal | Enter command mode (`:`) | `mappings.lua` |
| `<leader>fl` | Normal | Live grep across open buffers | `mappings.lua` |
| `<leader>z` | Normal | Toggle zoom/maximize current window | `configs/zoom.lua` |
| `gd` | Normal (LSP) | Telescope LSP definitions | `configs/lspconfig.lua` |
| `gr` | Normal (LSP) | Telescope LSP references | `configs/lspconfig.lua` |
| `gi` | Normal (LSP) | Telescope LSP implementations | `configs/lspconfig.lua` |
| `gq` | Normal (LSP) | Telescope diagnostics (current buffer) | `configs/lspconfig.lua` |

### Terminal (`terminal.nvim`)

| Key | Mode | Action | Defined In |
|---|---|---|---|
| `<leader>ts` | Normal/Visual | Send text to terminal | `configs/terminal.lua` |
| `<leader>to` | Normal | Toggle terminal | `configs/terminal.lua` |
| `<leader>tO` | Normal | Toggle terminal in new buffer | `configs/terminal.lua` |
| `<leader>tr` | Normal | Run command in terminal | `configs/terminal.lua` |
| `<leader>tR` | Normal | Run command in terminal in new buffer | `configs/terminal.lua` |
| `<leader>tx` | Normal | Kill terminal | `configs/terminal.lua` |

### Cscope (`cscope_maps.nvim`)

| Key | Mode | Action | Defined In |
|---|---|---|---|
| `<leader>cs` | Normal | Find all references to token under cursor | `cscope_maps.nvim` (default) |
| `<leader>cg` | Normal | Find global definition(s) of token under cursor | `cscope_maps.nvim` (default) |
| `<leader>cc` | Normal | Find all calls to function name under cursor | `cscope_maps.nvim` (default) |
| `<leader>ct` | Normal | Find all instances of text under cursor | `cscope_maps.nvim` (default) |
| `<leader>ce` | Normal | Egrep search for word under cursor | `cscope_maps.nvim` (default) |
| `<leader>cf` | Normal | Open filename under cursor | `cscope_maps.nvim` (default) |
| `<leader>ci` | Normal | Find files that include filename under cursor | `cscope_maps.nvim` (default) |
| `<leader>cd` | Normal | Find functions that function under cursor calls | `cscope_maps.nvim` (default) |
| `<leader>ca` | Normal | Find places where symbol is assigned a value | `cscope_maps.nvim` (default) |
| `<leader>cb` | Normal | Build cscope database | `cscope_maps.nvim` (default) |
| `<C-]>` | Normal | Do `:Cstag <cword>` | `cscope_maps.nvim` (default) |

### Telescope (`telescope.nvim`)

| Key | Mode | Action | Defined In |
|---|---|---|---|
| `<C-Up>` | Normal/Insert | Cycle to previous search in history | `configs/telescope.lua` |
| `<C-Down>` | Normal/Insert | Cycle to next search in history | `configs/telescope.lua` |
| `x` | Normal | Delete buffer (in buffer picker) | `configs/telescope.lua` |

### Autocomplete (`nvim-cmp`)

| Key | Mode | Action | Defined In |
|---|---|---|---|
| `<C-s>` | Insert | Manually trigger autocomplete | `configs/nvim-cmp.lua` |

## Local plugin: build_cscope.nvim

Located at `lua/plugins/build_cscope.nvim/`. Runs a `find` command to generate
`cscope.files` (respecting configured `file_types` and `ignore_paths`), then
calls `:Cs db build`. Invoke with `:BuildCscope` from the project root.

## Formatting

Uses `stylua` for Lua (2-space indent, 120-column width, double quotes).
Run via `:ConformFormat` or `<leader>fm`.
