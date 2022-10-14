local keymap = vim.keymap

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "_", "<C-x>")

-- Delete a word backwards
--keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Exiting insert mode
keymap.set("i", "JJ", "<ESC>", { noremap = true, silent = true })

-- Move text up and down
-- NOT WORKING
keymap.set("n", "<A-j>", ":m .+1<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-k>", ":m .-2<CR>", { noremap = true, silent = true })
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- New tab
keymap.set("n", "TE", ":tabedit<Return>", { silent = true })
-- Need to find keymap for closing tabedit windows and split panes --
-- Split window
keymap.set("n", "TS", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "TV", ":vsplit<Return><C-w>w", { silent = true })
-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "T<left>", "<C-w>h")
keymap.set("", "T<up>", "<C-w>k")
keymap.set("", "T<down>", "<C-w>j")
keymap.set("", "T<right>", "<C-w>l")
keymap.set("", "TH", "<C-w>h")
keymap.set("", "TK", "<C-w>k")
keymap.set("", "TJ", "<C-w>j")
keymap.set("", "TL", "<C-w>l")

-- Resizing panes
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
