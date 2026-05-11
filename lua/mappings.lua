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
