local config = function()
  local lsp_zero = require 'lsp-zero'
  local code = require 'code'

  local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  lsp_zero.extend_lspconfig {
    sign_text = true,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  require('lspconfig').lua_ls.setup {
    on_init = function(client)
      lsp_zero.nvim_lua_settings(client, {})
    end,
  }
  require('mason').setup {}
  require('mason-lspconfig').setup {
    automatic_installation = true,
    ensure_installed = code.servers,
    handlers = {
      function(server_name)
        if server_name ~= 'lua_ls' then
          require('lspconfig')[server_name].setup {}
        end
      end,
    },
  }

  local cmp = require 'cmp'
  local cmp_action = lsp_zero.cmp_action()

  local function border(hl_name)
    return {
      { '╭', hl_name },
      { '─', hl_name },
      { '╮', hl_name },
      { '│', hl_name },
      { '╯', hl_name },
      { '─', hl_name },
      { '╰', hl_name },
      { '│', hl_name },
    }
  end

  cmp.setup {
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        local kind = require('lspkind').cmp_format {
          mode = 'symbol_text',
          maxwidth = 30,
          preset = 'codicons',
        }(entry, vim_item)
        local strings = vim.split(kind.kind, '%s', { trimempty = true })
        kind.kind = ' ' .. (strings[1] or '') .. ' '
        kind.menu = '    (' .. (strings[2] or '') .. ')'

        return kind
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
    },
    window = {
      completion = {
        col_offset = -3,
        side_padding = 0,
        border = border 'WinSeparator',
      },
      documentation = {
        border = border 'WinSeparator',
      },
    },
    mapping = cmp.mapping.preset.insert {
      -- `Enter` key to confirm completion
      ['<CR>'] = cmp.mapping.confirm { select = false },

      -- Ctrl+Space to trigger completion menu
      ['<C-Space>'] = cmp.mapping.complete(),

      -- Navigate between snippet placeholder
      ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
      ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
    },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
  }

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })
end

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v4.x',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
  },
  config = config,
}
