require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fl", function()
  require('telescope.builtin').live_grep({grep_open_files=true})
end, { desc = 'Live Grep Open Files' })
