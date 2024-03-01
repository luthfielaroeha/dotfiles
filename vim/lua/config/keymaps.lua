M = {}

------------------------------
-- ===> Telescope
-- Find files using Telescope command-line sugar.
------------------------------
M.telescope = function()
  local map = vim.keymap.set
  local opts = { noremap=true, silent=true }

  map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
  map('n', '<Leader>fc', "<cmd>lua require('telescope.builtin').command_history()<CR>", opts)
  map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
  map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
  map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
end

M.builtin = function()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }
  local noremap = { noremap = true }
  local slient = { silent = true }

  ------------------------------
  -- => Visual mode related
  ------------------------------
  -- Visual mode pressing * or # searches for the current selection
  map('v', '*', ':<C-u>call VisualSelection(\'\', \'\')<CR>/<C-R>=@/<CR><CR>', opts)
  map('v', '#', ':<C-u>call VisualSelection(\'\', \'\')<CR>?<C-R>=@/<CR><CR>', opts)

  ---------------------------------------------------------------
  -- => Moving around, tabs, windows and buffers
  ---------------------------------------------------------------
  -- Disable highlight when <leader><cr> is pressed
  map('', '<leader><cr>', ':noh<cr>', opts)

  -- Smart way to move between windows
  map('', '<C-h>', '<C-W>h', noremap)
  map('', '<C-l>', '<C-W>l', noremap)

  -- Close the current buffer
  map('', '<leader>bd', ':Bclose<cr>:tabclose<cr>gT', noremap)

  -- Close all the buffers
  map('', '<leader>ba', ':bufdo bd<cr>', noremap)

  -- Open previous buffer
  map('', '<leader>z', '<C-^>', noremap)

  -- Navigate between buffer
  map('', '<leader>l', ':bnext<cr>', noremap)
  map('', '<leader>h', ':bprevious<cr>', noremap)

  -- Switch CWD to the directory of the open buffer
  map('', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', noremap)

  ---------------------------------------------------------------
  -- => Editing mappings
  ---------------------------------------------------------------
  -- Remap VIM 0 to first non-blank character
  map("n", "0", "^", silent)

  -- Set space to run @q macro
  map("n", "<Space>", "@q", {})

  -- Ctrl+c = copy | Ctrl+v = paste
  -- Only works in visual and insert mode to avoid conflict to visual-block key
  -- <C-v> in normal mode
  map("v", "<C-c>", '"+y', noremap)
  map("v", "<C-x>", '"+d', noremap)
  map("v", "<C-v>", 'c<ESC>"+p', noremap)

  -- Copy relative filepath (based on cwd) of current buffer
  map("n", "<leader>fp", ":let @+ = expand('%')<CR>", noremap)
end

M.builtin()
M.telescope()