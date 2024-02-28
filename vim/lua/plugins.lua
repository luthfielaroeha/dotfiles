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

------------------------------------------------------------
-- => Plugin settings
------------------------------------------------------------

------------------------------
-- ===> Telescope
-- Find files using Telescope command-line sugar.
------------------------------

require('telescope').setup{
  pickers = {
    buffers = {
      initial_mode = 'normal',
      sort_mru = true,
      ignore_current_buffer = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        n = {
          ["d"] = "delete_buffer",
        }
      }
    }
  }
}

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fc', "<cmd>lua require('telescope.builtin').command_history()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

------------------------------
-- ===> Autocompletion framework
-- Setup Auto Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
------------------------------

local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
})

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

------------------------------
-- ===> Color scheme
------------------------------
vim.cmd[[colorscheme tokyonight]]

------------------------------
-- ===> NERDTree
------------------------------
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1

vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeShowHidden = 0
vim.g.NERDTreeWinSize = 35
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NERDTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nb', ':NERDTreeFromBookmark<Space>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', opts)
