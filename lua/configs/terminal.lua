local M = {}

local opts = {
  layout = {
    open_cmd = "float",
    height = 0.9,
    width = 0.9,
  },
  cmd = { vim.o.shell },
  autoclose = false,
}

-- Single source of truth for terminal keymaps. `handler` is deferred behind
-- a function so requiring this module does not eagerly require("terminal")
-- or require("terminal.mappings"), keeping `lazy_keys()` cheap to call from
-- the plugin spec at startup.
M.keymaps = {
  {
    lhs = "<leader>ts",
    mode = { "n", "x" },
    expr = true,
    desc = "Terminal send text to terminal",
    handler = function() return require("terminal.mappings").operator_send end,
  },
  {
    lhs = "<leader>to",
    mode = "n",
    desc = "Terminal toggle terminal",
    handler = function() return require("terminal.mappings").toggle end,
  },
  {
    lhs = "<leader>tO",
    mode = "n",
    desc = "Terminal toggle terminal in a new buffer",
    handler = function() return require("terminal.mappings").toggle({ open_cmd = "enew" }) end,
  },
  {
    lhs = "<leader>tr",
    mode = "n",
    desc = "Terminal run a command in a terminal",
    handler = function() return require("terminal.mappings").run end,
  },
  {
    lhs = "<leader>tR",
    mode = "n",
    desc = "Terminal run a command in a terminal in a new buffer",
    handler = function() return require("terminal.mappings").run(nil, { layout = { open_cmd = "enew" } }) end,
  },
  {
    lhs = "<leader>tx",
    mode = "n",
    desc = "Terminal kill a terminal",
    handler = function() return require("terminal.mappings").kill end,
  },
}

M.user_setup = function()
  require("terminal").setup(opts)

  for _, keymap in ipairs(M.keymaps) do
    vim.keymap.set(keymap.mode, keymap.lhs, keymap.handler(), { expr = keymap.expr, desc = keymap.desc })
  end
end

-- Derives lazy.nvim's `keys` plugin-spec field from `M.keymaps` so the
-- lazy-load triggers and the real mappings never drift out of sync.
M.lazy_keys = function()
  local result = {}

  for _, keymap in ipairs(M.keymaps) do
    table.insert(result, { keymap.lhs, mode = keymap.mode, desc = keymap.desc })
  end

  return result
end

return M
