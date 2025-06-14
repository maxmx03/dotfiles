local config = function()
  local ok, luasnip = pcall(require, 'luasnip.loaders.from_vscode')
  if ok then
    luasnip.lazy_load()
  end

  local cmp = require 'cmp'
  local autopairs_is_installed, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
  if autopairs_is_installed then
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end

  cmp.setup {
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        local kind =
          require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
        local strings = vim.split(kind.kind, '%s', { trimempty = true })
        kind.kind = ' ' .. (strings[1] or '') .. ' '
        kind.menu = '    (' .. (strings[2] or '') .. ')'
        return kind
      end,
    },
    window = {
      completion = {
        border = 'single',
        col_offset = -3,
        side_padding = 0,
      },
      documentation = {
        border = 'single',
      },
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'supermaven' },
      { name = 'luasnip' },
      { name = 'bootstrap' },
      { name = 'path' },
      { name = 'emoji' },
    }, {
      { name = 'buffer' },
    }),

    mapping = cmp.mapping.preset.insert {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm { select = false },
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  }

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
  })
end

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-emoji',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'Jezda1337/cmp_bootstrap',
      {
        'onsails/lspkind.nvim',
        config = function()
          local lspkind = require 'lspkind'
          lspkind.init {
            preset = vim.g.neovide and 'codicons' or 'default',
            symbol_map = {
              Supermaven = '󱐌',
            },
          }
        end,
      },
      {
        'supermaven-inc/supermaven-nvim',
        config = function()
          require('supermaven-nvim').setup {
            ignore_filetypes = { ['neo-tree'] = true },
          }
        end,
      },
    },
    config = config,
  },
}
