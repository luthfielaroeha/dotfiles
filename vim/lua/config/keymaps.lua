M = {}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local noremap = { noremap = true }
local silent = { silent = true }

------------------------------
-- => Builtin keymap
------------------------------
M.builtin = function()
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
  map('', '<Esc>', ':noh<cr>', opts)

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


------------------------------
-- ===> Telescope
-- Find files using Telescope command-line sugar.
------------------------------
M.telescope = function()
  -- local map = vim.keymap.set
  -- local opts = { noremap=true, silent=true }

  map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
  map('n', '<Leader>fc', "<cmd>lua require('telescope.builtin').command_history()<CR>", opts)
  map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
  map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
  map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
end

------------------------------
-- ===> Neotree
-- Filesystem explorer
------------------------------
M.neotree = function()
  -- local opts = { noremap=true, silent=true }
  -- local map = vim.keymap.set

  map('n', '<leader>nn', ':Neotree toggle<CR>', opts)

  -- Open current file location in Neotree
  map('n', '<leader>nf', ':Neotree reveal<CR>', opts)
end

M.formatter = function()
  autofmt = function()
    require("conform").format({ async = true, lsp_fallback = true })
  end

  map('n', '<leader>%', autofmt, opts)
end

M.autocompletion = function()
  local cmp = require("cmp")

  local lsp_zero = require('lsp-zero')
  lsp_zero.extend_cmp()
  local cmp_action = lsp_zero.cmp_action()

  return {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
end

M.lsp = function()
  local quickfix = function()
    vim.lsp.buf.code_action({
      filter = function(a) return a.isPreferred end,
      apply = true
    })
  end

  map('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

M.init = function()
  M.builtin()
  M.telescope()
  M.neotree()
  M.formatter()
  M.lsp()
end

return M
