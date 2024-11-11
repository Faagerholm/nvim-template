-- import telescope plugin safely 
local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("telescope not found", vim.log.levels.ERROR)
  return
end

local a_ok, actions = pcall(require, "telescope.actions")
if not a_ok then
  vim.notify("telescope.actions not found", vim.log.levels.ERROR)
  return
end

local builtin = require("telescope.builtin")
local M = {}

M.search_dotfiles = function()
  builtin.find_files({
    prompt_title = "< VimRC >",
    cwd = "~/.config/nvim/",
  })
end

M.search_nvim = function()
  builtin.find_files({
    prompt_title = "< NvimRC >",
    cwd = "~/.config/nvim/",
  })
end

M.search_zsh = function()
  builtin.find_files({
    prompt_title = "< ZshRC >",
    cwd = "~/.config/zsh/",
  })
end

M.search_tmux = function()
  builtin.find_files({
    prompt_title = "< TmuxRC >",
    cwd = "~/.config/tmux/",
  })
end

M.search_bash = function()
  builtin.find_files({
    prompt_title = "< BashRC >",
    cwd = "~/.config/bash/",
  })
end

M.search_neovim = function()
  builtin.find_files({
    prompt_title = "< NeovimRC >",
    cwd = "~/.config/neovim/",
  })
end

M.search_vim = function()
  builtin.find_files({
    prompt_title = "< VimRC >",
    cwd = "~/.config/vim/",
  })
end

M.search_config = function()
  builtin.find_files({
    prompt_title = "< Config >",
    cwd = "~/.config/",
  })
end

M.search_dotfiles = function()
  builtin.find_files({
    prompt_title = "< Dotfiles >",
    cwd = "~/.config/",
  })
end

telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
      },
    },
    file_ignore_patterns = { "node_modules", ".git" },
  },
})

telescope.load_extension("fzf")


local status, outline = pcall(require, "outline")
if not status then
  vim.notify("outline not found", vim.log.levels.ERROR)
  return
end

outline.setup()
