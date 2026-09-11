return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvim-tree"),
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = require("configs.mason-lspconfig"),
    -- Loads only when opening a filetype with a configured LSP server (see
    -- `configs/lspconfig.lua`), instead of on every startup. Dependencies
    -- below load together with this plugin.
    ft = { "lua", "cpp", "sh", "typst", "go", "python" },
    dependencies = {
      {
        "mason-org/mason.nvim",
        -- Merge with NvChad's own mason `opts` (base46 theming, default
        -- `ui`/`PATH` settings) instead of replacing them, then apply the
        -- extra tree-sitter-cli install check on top.
        config = function(_, opts)
          require("configs.mason").user_setup(opts)
        end,
      },
      {
        "neovim/nvim-lspconfig",
        config = function()
          require("configs.lspconfig")
        end,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- No `lazy`/`event`/`ft` override here: NvChad's own spec for this
    -- plugin already sets `event = { "BufReadPost", "BufNewFile" }`.
    --
    -- Using `opts` (not `config`) so this merges with NvChad's own
    -- `nvchad.configs.treesitter` opts (base46 theming, default
    -- `ensure_installed`) instead of replacing them.
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "cpp" })
      return opts
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, conf)
      local overrides = require("configs.nvim-cmp")
      return vim.tbl_deep_extend('force', conf, overrides)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-smart-history.nvim",
        dependencies = {
          "kkharji/sqlite.lua",
        },
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
      },
    },
    config = function(_, opts)
      local telescope_config = require("configs.telescope")
      telescope_config.setup(opts)
    end,
  },

  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      -- optional [for whichkey hints]
      "folke/which-key.nvim",
      -- optional [for picker="telescope"]
      "nvim-telescope/telescope.nvim",
      -- optional [for devicons in telescope or fzf]
      "nvim-tree/nvim-web-devicons",
    },
    ft = {
      "cpp",
      "cfg",
      "proto",
      "json",
      "default",
    },
    opts = require("configs.cscope_maps"),
  },

  {
    dir = vim.fn.stdpath("config") .. "/lua/plugins/build_cscope.nvim",
    dependencies = {
      "dhananjaylatkar/cscope_maps.nvim",
    },
    ft = {
      "cpp",
      "cfg",
      "proto",
      "json",
      "default",
    },
    opts = require("configs.build_cscope"),
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewClose",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
      "DiffviewRefresh",
      "DiffviewLog",
    },
  },

  {
    "windwp/nvim-autopairs",
    enabled = false,
  },

  {
    'rebelot/terminal.nvim',
    config = function()
      require("configs.terminal").user_setup()
    end,
    keys = require("configs.terminal").lazy_keys(),
  },

  {
    "taigrr/zoom.nvim",
    cmd = { "ZoomToggle", "ZoomRestore" },
    keys = { { require("configs.zoom").key, desc = "Toggle window zoom" } },
    config = function()
      require("zoom").setup(require("configs.zoom"))
    end,
  },
}
