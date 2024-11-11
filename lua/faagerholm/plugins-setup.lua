-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add plugins
return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")


  use { "catppuccin/nvim", as = "catppuccin" } -- theme

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer")

  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- quick comment lines,selects etc.
  use("tpope/vim-commentary")

  -- status line
  use("nvim-lualine/lualine.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")
  use("ryanoasis/vim-devicons")

  -- overlay cmd line, messages, etc.
  use("MunifTanjim/nui.nvim")
  use("folke/noice.nvim")
  use("rcarriga/nvim-notify")

  -- neovim development plugins
  use("folke/neodev.nvim")
  use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}


  -- debugging
 use("mfussenegger/nvim-dap")
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
 use("theHamsta/nvim-dap-virtual-text")
 use("leoluz/nvim-dap-go")
 use("nvim-telescope/telescope-dap.nvim")

  -- go specific 
  use 'ray-x/go.nvim'
  use 'mattn/vim-goimports'

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  }) -- fuzzy finder
  use("hedyhli/outline.nvim") -- outline view

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing lsp servers, linters & formatters
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring lsp servers
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })
  use("onsails/lspkind.nvim")

  -- formatters & linters
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")

  -- linting server
  use("dense-analysis/ale")

  -- GitHub Copilot
  --  use("github/copilot.vim")

  -- auto closing
  -- use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

  -- git signs plugin
  use("lewis6991/gitsigns.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
