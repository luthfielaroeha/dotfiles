-- File explorer
local config = function()
  local opts = { noremap=true, silent=true }
  local map = vim.keymap.set

  vim.g.NERDSpaceDelims = 1
  vim.g.NERDCompactSexyComs = 1

  vim.g.NERDTreeWinPos = "right"
  vim.g.NERDTreeShowHidden = 0
  vim.g.NERDTreeWinSize = 35

  map('n', '<Leader>nn', ':NERDTreeToggle<CR>', opts)
  map('n', '<Leader>nb', ':NERDTreeFromBookmark<Space>', opts)
  map('n', '<Leader>nf', ':NERDTreeFind<CR>', opts)
end

return {
  {
    "preservim/nerdtree",
    config = config,
    lazy = false,
    cmd = "Telescope",
    event = { "BufReadPre", "BufNewFile" },
  }
}
