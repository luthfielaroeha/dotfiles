local use = require('packer').use

require('packer').startup(function()

  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  use 'folke/tokyonight.nvim'

  -- Visualize LSP progress
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  })

  -- Autocompletion framework
  use("hrsh7th/nvim-cmp")

  use({
    -- cmp LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- cmp Snippet completion
    "hrsh7th/cmp-vsnip",
    -- cmp Path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })

  -- See hrsh7th other plugins for more great completion sources!
  -- Snippet engine
  use('hrsh7th/vim-vsnip')

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
end)

require('lua/plugins/colorscheme')
require('lua/plugins/nerdtree')
require('lua/plugins/nvim-cmp')
require('lua/plugins/telescope')

