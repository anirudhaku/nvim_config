return {
  statusline = {
    theme = 'default',
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "position" },
    modules = {
      position = function()
        local config = require("nvconfig")
        local sep_l = ""
        local icon = ""
        if config.ui.statusline.theme == 'default' then
          local utils = require("nvchad.stl.utils")
          local sep_style = config.ui.statusline.separator_style
          local sep_icons = utils.separators
          local separators = (type(sep_style) == "table" and sep_style) or sep_icons[sep_style]
          icon = ""
          sep_l = separators["left"]
        end
        return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. icon .. " %#St_pos_text# %l:%v "
      end,
    },
  },
}
