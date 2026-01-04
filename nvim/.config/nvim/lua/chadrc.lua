---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  integrations = { "semantic_tokens" },
}

M.nvdash = { load_on_startup = false }
M.lsp = { signature = false }

M.ui = {
  cmp = {
    style = "catppuccin_colored",
    icons_left = true,
  },
  statusline = {
    theme = "vscode",
    order = {
      "mode",
      "file",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cwd",
    },
  },
  tabufline = {
    enabled = false,
  },
}

return M
