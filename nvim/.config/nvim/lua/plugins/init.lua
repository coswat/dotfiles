return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "rust",
        "toml",
        "json",
        "python",
      },
    },
  },

  {
    import = "nvchad.blink.lazyspec",
  },

  {
    "folke/twilight.nvim",
    opts = {},
    cmd = "Twilight",
  },
}
