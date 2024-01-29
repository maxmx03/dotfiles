return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    notify = {
      enabled = false,
    },
    lsp = {
      signature = {
        enabled = false,
      },
      progress = {
        enabled = false,
        format = 'lsp_progress',
        format_done = 'lsp_progress_done',
      },
    },
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d fewer lines' },
            { find = '%d more lines' },
          },
        },
        opts = { skip = true },
      },
    },
    messages = {
      view = 'notify',
      enabled = false,
      view_error = 'notify',
      view_warn = 'notify',
      view_history = 'messages',
      view_search = 'virtualtext',
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
