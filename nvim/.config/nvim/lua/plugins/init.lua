return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  { "nvzone/volt" },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter" },
    dependencies = {
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
      },
    },
    opts_extend = { "sources.default" },
    opts = function()
      return require "configs.blink"
    end,
  },

  {
    "folke/twilight.nvim",
    opts = {},
    cmd = "Twilight",
  },

  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = function()
      return require "configs.fzf"
    end,
  },
}
