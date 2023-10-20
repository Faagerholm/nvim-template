vim.g.mapleader = " "

keymap = vim.keymap -- for conciseness

-- general keymaps

-- map jk to <Esc> in insert mode
keymap.set("i", "jk", "<Esc>")

-- map <leader>h to :noh in normal mode
keymap.set("n", "<leader>nh", ":noh<CR>")

-- do not copy character deletion to the clipboard
keymap.set("n", "x", "_x")

-- move visual block up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep vim in middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- quick save
keymap.set("n", "<leader>w", ":w<CR>")
-- quick close buffer
keymap.set("n", "<leader>q", ":bd<CR>")

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- equalize window sizes
keymap.set("n", "<leader>sc", ":close<CR>") -- close current window

-- move between windows
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabnext<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabprevious<CR>") -- go to previous tab

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximizer

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>" ) -- toggle nvim-tree

 -- telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<cr>") -- find files
keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>") -- grep
keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>") -- grep current word
keymap.set("n", "<leader>fb", ":Telescope buffers<cr>") -- buffers
keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>") -- help tags
keymap.set("n", "<leader>fm", ":Telescope marks<cr>") -- marks

-- move between buffers
keymap.set("n", "<leader>bn", ":bnext<CR>") -- go to next buffer
keymap.set("n", "<leader>bb", ":bprevious<CR>") -- go to previous buffer (backwards)
keymap.set("n", "<leader>bd", ":bd<CR>") -- delete current buffer

-- REST-client, run on cursor
keymap.set("n", "<leader>rr", "<Plug>RestNvim") -- run REST request under cursor

