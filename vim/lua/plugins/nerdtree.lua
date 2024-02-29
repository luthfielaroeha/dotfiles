------------------------------
-- ===> NERDTree
------------------------------
local opts = { noremap=true, silent=true }

vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1

vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeShowHidden = 0
vim.g.NERDTreeWinSize = 35
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NERDTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nb', ':NERDTreeFromBookmark<Space>', opts)
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', opts)
