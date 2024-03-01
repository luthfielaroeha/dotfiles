------------------------------
-- => Visual mode related
------------------------------
-- Visual mode pressing * or # searches for the current selection
vim.api.nvim_set_keymap('v', '*', ':<C-u>call VisualSelection(\'\', \'\')<CR>/<C-R>=@/<CR><CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '#', ':<C-u>call VisualSelection(\'\', \'\')<CR>?<C-R>=@/<CR><CR>', {noremap = true, silent = true})

---------------------------------------------------------------
-- => Moving around, tabs, windows and buffers
---------------------------------------------------------------
-- Disable highlight when <leader><cr> is pressed
vim.api.nvim_set_keymap('', '<leader><cr>', ':noh<cr>', {noremap = true, silent = true})

-- Smart way to move between windows
vim.api.nvim_set_keymap('', '<C-h>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('', '<C-l>', '<C-W>l', {noremap = true})

-- Close the current buffer
vim.api.nvim_set_keymap('', '<leader>bd', ':Bclose<cr>:tabclose<cr>gT', {noremap = true})

-- Close all the buffers
vim.api.nvim_set_keymap('', '<leader>ba', ':bufdo bd<cr>', {noremap = true})

-- Open previous buffer
vim.api.nvim_set_keymap('', '<leader>z', '<C-^>', {noremap = true})

-- Navigate between buffer
vim.api.nvim_set_keymap('', '<leader>l', ':bnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>h', ':bprevious<cr>', {noremap = true})

-- Useful mappings for managing tabs
vim.api.nvim_set_keymap('', '<leader>tn', ':tabnew<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>to', ':tabonly<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>tc', ':tabclose<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>tm', ':tabmove', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>t<leader>', ':tabnext', {noremap = true})

-- Switch CWD to the directory of the open buffer
vim.api.nvim_set_keymap('', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', {noremap = true})

---------------------------------------------------------------
-- => Editing mappings
---------------------------------------------------------------
-- Remap VIM 0 to first non-blank character
vim.api.nvim_set_keymap("n", "0", "^", { silent = true })

-- Set space to run @q macro
vim.api.nvim_set_keymap("n", "<Space>", "@q", {})

-- Move a line of text using ALT+[jk] or Command+[jk] on mac
vim.api.nvim_set_keymap("n", "<M-j>", "mz:m+<cr>`z", { silent = true})
vim.api.nvim_set_keymap("n", "<M-k>", "mz:m-2<cr>`z", { silent = true})
vim.api.nvim_set_keymap("v", "<M-j>", ":m'>+<cr>`zgv`yo`z", { silent = true})
vim.api.nvim_set_keymap("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", { silent = true})

if vim.fn.has("mac") or vim.fn.has("macunix") then
  vim.api.nvim_set_keymap("n", "<D-j>", "<M-j>", { silent = true })
  vim.api.nvim_set_keymap("n", "<D-k>", "<M-k>", { silent = true })
  vim.api.nvim_set_keymap("v", "<D-j>", "<M-j>", { silent = true })
  vim.api.nvim_set_keymap("v", "<D-k>", "<M-k>", { silent = true })
end

-- Ctrl+c = copy | Ctrl+v = paste
-- Only works in visual and insert mode to avoid conflict to visual-block key
-- <C-v> in normal mode
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", '"+d', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-v>", 'c<ESC>"+p', { noremap = true })

-- Copy relative filepath (based on cwd) of current buffer
vim.api.nvim_set_keymap("n", "<leader>fp", ":let @+ = expand('%')<CR>", { noremap = true })

