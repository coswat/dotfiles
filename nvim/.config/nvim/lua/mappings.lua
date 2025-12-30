local map = vim.keymap.set

-- general
map("n", "<Space>", "<Nop>", { silent = true })
map("n", "9", "$", { noremap = true, silent = true })
map({ "n", "v" }, "<C-h>", "<cmd>nohlsearch<cr>")
map({ "n", "i", "v" }, "<F1>", "<ESC>")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- disabled arrow key movements for avoiding bad habbit
local opts = { noremap = true, silent = true }

map({ "n", "i", "v" }, "<Up>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Down>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Left>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Right>", "<Nop>", opts)

-- twilight
map("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

-- fzf lua
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "fzf.lua find files" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "fzf.lua find buffers" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "fzf.lua find oldfiles" })
map("n", "<leader>fx", "<cmd>FzfLua zoxide<CR>", { desc = "fzf.lua recent zoxide paths" })

-- nvchad themes
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- terminals
map({ "n", "t" }, "<leader>v", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
