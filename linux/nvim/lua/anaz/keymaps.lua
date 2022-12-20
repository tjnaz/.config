local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- From the old config
-- local keymapOld = vim.keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- From the current config
-- Normal --
-- Vertical Movement --
keymap("n", "<c-d>", "<C-d>zz", opts)
keymap("n", "<c-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)

-- ThePrimegan
vim.keymap.set("x", "<leader><leader>p", [["_dP]])
vim.keymap.set("n", "<leader><leader>p", [["_dP]])
vim.keymap.set("v", "<leader><leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader><leader>y", [["+y]])
vim.keymap.set("n", "<leader><leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader><leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader><leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader><leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader><leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Managing windows
-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<Leader>w", ":Bdelete<CR>", opts)

-- Insert --
-- Press JJ fast to exit insert mode
keymap("i", "HH", "<ESC>", opts)

-- Visual --
-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- From the current config
-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("n", "<Leader>a", ":%y<CR>", opts)

--- Remove the highlights after search
keymap("n", "<CR>", ":noh<CR><ESC>", opts)
keymap("v", "<CR>", ":noh<CR><ESC>", opts)
keymap("x", "<CR>", ":noh<CR><ESC>", opts)

--- Oen and close Nvim-Tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

--- FLOATERM ---
--- Open/close floaterm
keymap("n", "<Leader>g", ":FloatermNew lazygit<CR>", opts)
--- Open projects

--- Clang & Make Compiling
keymap("n", "<Leader><Leader>cr", ":FloatermNew --autoclose=0 clang % -o %< && ./%<<CR>", opts)
keymap("n", "<Leader><Leader>cs", ":FloatermNew --autoclose=0 clang % -o %< -lcs50 && ./%<<CR>", opts)
keymap("n", "<Leader><Leader>s", ":FloatermNew --silent --name=server live-server --cors --open=%<CR>", opts)
keymap("n", "<Leader><Leader>ks", ":FloatermKill server<CR>", opts)

keymap("n", "<Leader>P", ":Telescope projects<CR>HH", opts)
