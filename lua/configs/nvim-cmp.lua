local cmp = require("cmp")

return {
  completion = {
    autocomplete = false,
  },

  mapping = {
    ["<C-s>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Manual })
  },
}
