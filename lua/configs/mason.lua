local M = {}

M.user_setup = function()
  local mason = require("mason")
  local mason_registry = require("mason-registry")

  mason.setup()

  if not mason_registry.is_installed('tree-sitter-cli') then
    vim.cmd.MasonInstall('tree-sitter-cli')
  end
end

return M
