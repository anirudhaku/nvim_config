local M = {}

local opts = {
  layout = { open_cmd = "float" },
  cmd = { vim.o.shell },
  autoclose = false,
}

M.user_setup = function()
  local terminal = require("terminal")

  -- Setup terminal with options
  terminal.setup(opts)

  -- Set up keymaps
  local map = vim.keymap.set
  local term_map = require("terminal.mappings")

  map({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true, desc = "Terminal send text to terminal" })
  map("n", "<leader>to", term_map.toggle, { desc = "Terminal toggle terminal" })
  map("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }),
    { desc = "Terminal toggle terminal in a new buffer" })
  map("n", "<leader>tr", term_map.run, { desc = "Terminal run a command in a terminal" })
  map("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }),
    { desc = "Terminal run a command in a terminal in a new buffer" })
  map("n", "<leader>tx", term_map.kill, { desc = "Terminal kill a terminal" })
end

return M
