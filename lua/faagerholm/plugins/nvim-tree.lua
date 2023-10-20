-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { 
      desc = 'nvim tree: ' .. desc, 
      buffer = bufnr, 
      noremap = true ,
      silent = true,
      nowait = true,
    }
  end

  -- default mapping
  api.config.mappings.default_on_attach(bufnr)

  -- change root to current directory
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
end

-- configure nvim-tree
nvimtree.setup({
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  diagnostics = {
    enable = true,
  },
  git = {
    enable = true,
  	ignore = false,
  },
  renderer = {
    highlight_git = true,
  },
  view = {
    width = 40,
  },
  -- setup on_attach
  on_attach = on_attach,
})

-- open nvim-tree on setup
local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
