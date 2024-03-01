local use = require('packer').use

require('packer').startup(function()

  use 'wbthomason/packer.nvim' -- Package manager

  use 'folke/tokyonight.nvim'

  -- File explorer
  use('preservim/nerdtree')

  -- Commenter
  use('preservim/nerdcommenter')

  -- Git inside vim
  use('tpope/vim-fugitive')

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- LSP Configurations
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
end)

require('lua/plugin/colorscheme')
require('lua/plugin/nerdtree')
require('lua/plugin/nvim-cmp')
require('lua/plugin/telescope')
require('lua/plugin/treesitter')
require('lua/plugin/lsp')

