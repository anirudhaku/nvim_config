local M = {}

M.user_setup = function(opts)
  local mason = require("mason")
  local mason_registry = require("mason-registry")

  mason.setup(opts)

  if not mason_registry.is_installed('tree-sitter-cli') then
    vim.cmd.MasonInstall('tree-sitter-cli')
  end
end

return M
