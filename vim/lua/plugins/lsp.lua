local lspconfig = function()
  ------------------------------------------------
  -- LSP Zero default config
  ------------------------------------------------
  local lsp_zero = require('lsp-zero')
  lsp_zero.extend_lspconfig()

  lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
  end)

  ------------------------------------------------
  -- LSP Theme
  ------------------------------------------------
  -- Setup Sign Icons
  lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
  })

  ------------------------------------------------
  -- Server Configuration
  ------------------------------------------------
  -- Lua for Neovim
  local lua_opts = lsp_zero.nvim_lua_ls()
  require('lspconfig').lua_ls.setup(lua_opts)

  -- Javascript eslint
  require('lspconfig').eslint.setup({
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  })

  require('lspconfig').tsserver.setup({ });
end

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = lspconfig,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  }
}
