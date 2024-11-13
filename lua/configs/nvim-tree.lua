return {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    preserve_window_proportions = false,
    width = {
      min = 20,
      max = 60,
      padding = 0,
    },
  },

  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },

  filters = {
    git_ignored = false,
  },
}
