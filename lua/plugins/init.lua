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
    lazy = false,
    dependencies = {
      {
        "mason-org/mason.nvim",
        config = function()
          require("configs.mason").user_setup()
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
    lazy = false,
    config = function()
      require("configs.nvim-treesitter").user_setup()
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
    lazy = false,
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
    lazy = false,
  },

  {
    "hamidi-dev/kaleidosearch.nvim",
    dependencies = {
      "tpope/vim-repeat",       -- optional for dot-repeatability
      "stevearc/dressing.nvim", -- optional for nice input
    },
    opts = require("configs.kaleidosearch"),
  },
}
