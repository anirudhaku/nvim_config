-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nv_on_attach = require("nvchad.configs.lspconfig").on_attach
local nv_on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- default on_attach function to set mappings
-- note: cannot do this in lua/mappings.lua!!!
local default_on_attach = function(client, bufnr)
  nv_on_attach(client, bufnr)

  local map = vim.keymap.set
  local telescope_builtin = require('telescope.builtin')
  local opts = function(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gd", telescope_builtin.lsp_definitions(),
      opts("Show LSP definitions in Telescope"))
  map("n", "gr", telescope_builtin.lsp_references(),
      opts("Show LSP references in Telescope"))
  map("n", "gi", telescope_builtin.lsp_implementations(),
      opts("Show LSP implementations in Telescope"))
  map("n", "gq", telescope_builtin.diagnostics(),
      opts("Show LSP diagnostics in Telescope"))
end

-- add lsps with default config to this list
local servers = { "bashls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = default_on_attach,
    on_init = nv_on_init,
    capabilities = capabilities,
  }
end

-- clangd
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    -- not sure why this is needed...
    client.server_capabilities.signatureHelpProvider = false
    default_on_attach(client, bufnr)
  end,
  on_init = nv_on_init,
  capabilities = capabilities,
  cmd = { "clangd", "--log=verbose" },
  filetypes = { "cpp" },
}
