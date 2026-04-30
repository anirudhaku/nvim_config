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
(`lua_ls`, `clangd`, `bashls`).

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

| Key | Mode | Action |
|---|---|---|
| `;` | Normal | Enter command mode (`:`) |
| `<leader>fl` | Normal | Live grep across open buffers |
| `gd` | Normal (LSP) | Telescope LSP definitions |
| `gr` | Normal (LSP) | Telescope LSP references |
| `gi` | Normal (LSP) | Telescope LSP implementations |
| `gq` | Normal (LSP) | Telescope diagnostics (current buffer) |

## Local plugin: build_cscope.nvim

Located at `lua/plugins/build_cscope.nvim/`. Runs a `find` command to generate
`cscope.files` (respecting configured `file_types` and `ignore_paths`), then
calls `:Cs db build`. Invoke with `:BuildCscope` from the project root.

## Formatting

Uses `stylua` for Lua (2-space indent, 120-column width, double quotes).
Run via `:ConformFormat` or `<leader>fm`.
