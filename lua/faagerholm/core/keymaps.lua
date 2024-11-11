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

-- debugging
keymap.set("n", "<leader>dd", ":DapToggleBreakpoint<CR>") -- toggle breakpoint
keymap.set("n", "<F5>", ":DapContinue<CR>") -- continue
keymap.set("n", "<F1>", ":DapStepInto<CR>") -- step into
keymap.set("n", "<F2>", ":DapStepOver<CR>") -- step over
keymap.set("n", "<F3>", ":DapStepOut<CR>") -- step out
keymap.set("n", "<F4>", ":DapTerminate<CR>") -- disconnect
keymap.set("n", "<leader>du", ":DapUiToggle<CR>") -- toggle dap ui
keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>") -- debug test
keymap.set("n", "<leader>dl", ":lua require'dap-go'.debug_last_test()<CR>") -- debug last test
keymap.set("n", "<leader>dr", ":lua require'dapui'.open({reset=true})<CR>", {noremap = true}) -- reset dap ui
keymap.set("n", "<leader>dc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>") -- set breakpoint condition
keymap.set("n", "<leader>dp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>") -- set log point

-- misc 
keymap.set("n", "<leader>rr", "<Plug>RestNvim") -- run REST request under cursor


