require("nvchad.mappings")

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD Enter command mode." })
map("n", "<leader>fl", function()
  require('telescope.builtin').live_grep({grep_open_files=true})
end, { desc = 'Telescope Live Grep Open Files' })

-- Remove NvChad's built-in term keybindings (using rebelot/terminal.nvim instead)
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap({ "n", "t" }, "<A-h>")
unmap({ "n", "t" }, "<A-v>")
unmap({ "n", "t" }, "<A-i>")

-- Terminal
local term_map = require("terminal.mappings")
map({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
map("n", "<leader>to", term_map.toggle, { desc = "Terminal toggle terminal" })
map("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }),
  { desc = "Terminal toggle terminal in a new buffer" })
map("n", "<leader>tr", term_map.run, { desc = "Terminal run a command in a terminal" })
map("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }),
  { desc = "Terminal run a command in a terminal in a new buffer" })
map("n", "<leader>tx", term_map.kill, { desc = "Terminal kill a terminal" })
