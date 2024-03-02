-- Autocompletion framework
local config = function()
  local cmp = require('cmp')
  local lsp_zero = require('lsp-zero')

  cmp.setup({
    snippet = {
      -- Specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    formatting = lsp_zero.cmp_format(),
    preselect = cmp.PreselectMode.None,
    mapping = require('config.keymaps').autocompletion(),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = "path" },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

return {
  {
    "hrsh7th/nvim-cmp",
    config = config,
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
    event = "InsertEnter",
  }
}
