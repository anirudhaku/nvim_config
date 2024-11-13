return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvim-tree"),
  },

  {
    "williamboman/mason.nvim",
    opts = require("configs.mason"),
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.nvim-treesitter"),
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
    "github/copilot.vim",
    lazy = false,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },
  }
}
