local opt_overrides = {
  defaults = {
    history = {
      path = vim.fn.stdpath("data") .. '/telescope_history.sqlite3',
      limit = 100,
    },
    mappings = {
      n = {
        ["<C-Down>"] = require("telescope.actions").cycle_history_next,
        ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
      },
      i = {
        ["<C-Down>"] = require("telescope.actions").cycle_history_next,
        ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        n = {
          ["x"] = "delete_buffer",
        },
      },
    },
    diagnostics = {
      layout_strategy = 'vertical',
      layout_config = {
        height = 0.95,
        mirror = true,
        prompt_position = 'top',
        preview_cutoff = 1,
        preview_height = 0.5,
      },
    },
  },
}

return {
  setup = function(opts)
    local telescope = require("telescope")
    local combined_opts = vim.tbl_deep_extend('force', opts, opt_overrides)
    telescope.setup(combined_opts)
    telescope.load_extension("smart_history")
  end,
}
