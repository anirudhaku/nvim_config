-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nv_on_attach = require("nvchad.configs.lspconfig").on_attach
local nv_on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
capabilities["offsetEncoding"] = { "utf-16" }

-- default on_attach function to set mappings
-- note: cannot do this in lua/mappings.lua!!!
local default_on_attach = function(client, bufnr)
  nv_on_attach(client, bufnr)

  local map = vim.keymap.set
  local telescope_builtin = require('telescope.builtin')
  local opts = function(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gd", telescope_builtin.lsp_definitions,
      opts("Show LSP definitions in Telescope"))
  map("n", "gr", telescope_builtin.lsp_references,
      opts("Show LSP references in Telescope"))
  map("n", "gi", telescope_builtin.lsp_implementations,
      opts("Show LSP implementations in Telescope"))
  -- Need to override bufnr with 0. Telescope, oddly, only allows two values for
  -- bufnr:
  -- Number 0 - current buffer.
  -- nil - entire workspace.
  local telescope_builtin_local_diagnostics = function()
    telescope_builtin.diagnostics { bufnr = 0, }
  end
  map("n", "gq", telescope_builtin_local_diagnostics,
      opts("Show LSP diagnostics in Telescope"))
end

-- add lsps with default config to this list
local servers = { "bashls",  "lua_ls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = default_on_attach,
    on_init = nv_on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

-- clangd
vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    -- not sure why this is needed...
    client.server_capabilities.signatureHelpProvider = false
    default_on_attach(client, bufnr)
  end,
  on_init = nv_on_init,
  capabilities = capabilities,
  cmd = { "clangd", "-j=2" },
  filetypes = { "cpp" },
})
vim.lsp.enable("clangd")
