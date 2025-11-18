require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Space>", "<Nop>", { silent = true })
map("n", "9", "$", { noremap = true, silent = true })
map({ "n", "i", "v" }, "<F1>", "<ESC>")

-- Disabled arrow key movements for avoiding bad habbit
local opts = { noremap = true, silent = true }

map({ "n", "i", "v" }, "<Up>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Down>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Left>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Right>", "<Nop>", opts)

-- Twilight toggle mappigs
map("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

local telescope = require "telescope.builtin"
map("n", "<leader>g", telescope.diagnostics, { desc = "LSP Diagnostics" })

-- Close any opened window with <Esc> button
map("n", "<Esc>", function()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
end, { silent = true })
