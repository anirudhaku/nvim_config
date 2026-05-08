local M = {}

M.user_setup = function()
  -- setup nvim-treesitter first
  require("nvim-treesitter").setup({})

  require('nvim-treesitter').install({ 'cpp', 'lua' })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'cpp', 'lua' },
    callback = function() vim.treesitter.start() end,
  })
end

return M
