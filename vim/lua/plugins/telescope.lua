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

