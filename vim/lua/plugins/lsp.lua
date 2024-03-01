local config = function()
  ------------------------------------------------
  -- LSP servers
  ------------------------------------------------

  local servers = {
    'rust_analyzer',
    'eslint'
  }

  for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
      on_attach = on_attach,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      }
    }
  end

  ------------------------------------------------
  -- LSP keybinding
  ------------------------------------------------

  local opts = { noremap=true, silent=true }

  vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<Leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


  ------------------------------------------------
  -- LSP theme
  ------------------------------------------------

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
}
