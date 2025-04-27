return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    messages = {
      enabled = false,
      view = 'notify',
      view_error = 'notify',
      view_warn = 'notify',
      view_history = 'messages',
      view_search = 'virtualtext',
    },
    notify = {
      enabled = true,
      view = 'notify',
    },
    lsp = {
      progress = {
        enabled = false,
        format_done = 'lsp_progress_done',
        throttle = 1000 / 30,
        view = 'mini',
      },
      override = {
        -- override the default lsp markdown formatter with Noice
        ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
        -- override the lsp markdown formatter with Noice
        ['vim.lsp.util.stylize_markdown'] = false,
        -- override cmp documentation with Noice (needs the other options to work)
        ['cmp.entry.get_documentation'] = false,
      },
      hover = {
        enabled = false,
        silent = false,
        view = nil,
        opts = {},
      },
      signature = {
        enabled = false,
        auto_open = {
          enabled = true,
          trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
          throttle = 50, -- Debounce lsp signature help request by 50ms
        },
        view = nil, -- when nil, use defaults from documentation
        opts = {}, -- merged with defaults from documentation
      },
      message = {
        enabled = false,
        view = 'notify',
        opts = {},
      },
    },
    health = {
      checker = false, -- Disable if you don't want health checks to run
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
