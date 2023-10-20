# A "template" to get started with nvim
This is by no mean a complete nvim setup, but a baseline that should work to get you started with.

In the following README we will quickly go through what each file/directory contains
and how you should modify the to your liking.

## Introduction

NeoVim, or nvim, is a hight customisable editor based on the popular  vim editor.
Nvim has multiple ways of configuring, with one of the being packer. In the template we are using
packer. Other big ways are with lazy.nvim and vim-plug.

## Recommendation

To be effective with NeoVim, I'd recommend using it with other tools like tmux, but this is not a requirement.
Play around with different tools, and do not install too many at once.

## Tree (setup structure)

~/.config/nvim
├── init.lua                -- enty point for nvim
└── lua                     -- autoloaded
└── faagerholm              -- you configuration folder
    ├── core                -- core nvim setup
    │   ├── colorscheme.lua -- custom colors
    │   ├── keymaps.lua     -- custom keymaps
    │   ├── options.lua     -- vim options/settings
    │   └── theme.lua       -- theme
    ├── plugins             -- contains files for given plugin options
    │   ├── gitsigns.lua
    │   ├── lsp             -- Language Server Protocol,
    │   │   ├── lspconfig.lua
    │   │   ├── lspsaga.lua
    │   │   ├── mason.lua
    │   │   └── null-ls.lua
    │   ├── lualine.lua     -- status line for nvim
    │   ├── nvim-cmp.lua    -- autocomplete
    │   ├── nvim-tree.lua   -- tree finder
    │   ├── rest-nvim.lua   -- rest client for inline rest requests
    │   ├── telescope.lua   -- telescope for fuzzy finding
    │   └── treesitter.lua  -- code highlight and parser
    └── plugins-setup.lua   -- plugins entrypoint

## Installation

download neovim from here: https://neovim.io/
copy this folder (excluding README) to ~/.config/nvim

start by exploring lua/faagerholm/plugins-setup.lua and lua/core files.

_Start hacking, and rember, exit with :wq_