local options = {
  keymaps = {
    enabled = true,                      -- Set to false to disable default keymaps
    open = "<leader>ss",                 -- Open input prompt for search
    clear = "<leader>sc",                -- Clear highlights (reset to clean slate)
    add_new_word = "<leader>sn",         -- Add a new word to existing highlights
    add_cursor_word = "<leader>sa",      -- Add word under cursor to highlights OR current visual selection
    colorize_all_words = "<leader>sw",   -- Colorize all vim 'word' tokens
    colorize_all_WORDS = "<leader>sW",   -- Colorize all vim 'WORD' tokens
    colorize_all_lines = "<leader>sl",   -- Colorize all lines in current buffer
    opts = {
      noremap = true,
      silent = true,
    },
  },
}

return options
