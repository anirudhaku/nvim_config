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
      max = 70,
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

  filesystem_watchers = {
    enable = true,
    ignore_dirs = {
      ".git",
      "node_modules",
      ".zig-cache", -- Example of a directory to ignore
    },
  },
}
