local use = require('packer').use

require('packer').startup(function()

  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'folke/tokyonight.nvim'
end)

------------------------------------------------------------
-- => Plugin settings
------------------------------------------------------------

-- Find files using Telescope command-line sugar.
local opts = { noremap=true, silent=true }

require('telescope').setup{
  pickers = {
    buffers = {
      initial_mode = 'normal'
    }
  }
}

vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fc', "<cmd>lua require('telescope.builtin').command_history()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

------------------------------
-- => Color scheme
------------------------------
vim.cmd[[colorscheme tokyonight]]
