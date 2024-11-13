return function()
  vim.api.nvim_set_hl(0, "@string", { link = "String" })
  return {
    ensure_installed = {
      "lua",
      "cpp",
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = {
      enable = true,
    },
  }
end
