local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- general
map("n", "<Space>", "<Nop>", { silent = true })
-- 9 as $ , go to end of the line
map("n", "9", "$", opts)
-- clear search highlights
map({ "n", "v" }, "<C-h>", "<cmd>nohlsearch<cr>")
-- using f1 as esc button
map({ "n", "i", "v" }, "<F1>", "<Esc>")
-- clear highlights
map("n", "<Esc>", "<cmd>noh<CR>")
-- copy/yoink the whole file
map("n", "<C-c>", "<cmd>%y+<CR>")
-- execute selected lua lines
map("v", "<leader>x", ":lua<CR>")

-- disabled arrow key movements for avoiding bad habbit
map({ "n", "i", "v" }, "<up>", "<nop>", opts)
map({ "n", "i", "v" }, "<down>", "<nop>", opts)
map({ "n", "i", "v" }, "<left>", "<nop>", opts)
map({ "n", "i", "v" }, "<right>", "<nop>", opts)

-- twilight
map("n", "<leader>tw", "<cmd>Twilight<CR>")

-- fzf lua
-- fine all files inside of our current dir
map("n", "<leader>ff", "<cmd>FzfLua files<cr>")
-- find all buffers
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>")
-- find old files
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>")
-- find recent zoxide cd'ed paths
map("n", "<leader>fx", "<cmd>FzfLua zoxide<CR>")

-- nvchad themes
-- listing theme
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end)

-- terminals
-- open a vertical terminal which is toggleable
map({ "n", "t" }, "<leader>v", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end)

-- open a horizontal terminal which is toggleable
map({ "n", "t" }, "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end)
