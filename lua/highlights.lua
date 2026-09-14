-- Custom highlight overrides that base46's hl_override mechanism cannot
-- express (e.g. groups not already defined in a base46 integration table,
-- such as clangd's semantic token @lsp.typemod.* groups).

-- distinguish variable/member scope using clangd semantic tokens, resolved
-- from the active theme's named base_30 colors so these adapt on theme change
local colors = require("base46").get_theme_tb "base_30"
local lighten = require("base46.colors").change_hex_lightness

vim.api.nvim_set_hl(0, "@lsp.typemod.variable.globalScope", { fg = lighten(colors.teal, 15) })
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.fileScope", { fg = lighten(colors.cyan, -15) })
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.classScope", { fg = lighten(colors.teal, 15) })
vim.api.nvim_set_hl(0, "@lsp.typemod.property.classScope", { fg = lighten(colors.white, -15) })
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.functionScope", { fg = colors.white })
vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.functionScope", { fg = lighten(colors.purple, -15) })
vim.api.nvim_set_hl(0, "@lsp.mod.static", { italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.macro", { fg = lighten(colors.green, -15) })
