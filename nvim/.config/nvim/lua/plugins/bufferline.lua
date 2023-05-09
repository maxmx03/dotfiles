return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    config = function()
      local colors = require('fluoromachine.palettes.retrowave')

      require('bufferline').setup {
        options = {
          mode = 'buffers',
          separator_style = 'slant',
          always_show_bufferline = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true,
          diagnostics = 'nvim_lsp',
        },
        highlights = {
          separator = {
            fg = colors.fg,
            bg = colors.bg,
          },
          separator_selected = {
            fg = colors.alt_bg,
          },
          background = {
            fg = colors.fg,
            bg = colors.bg,
          },
          buffer_selected = {
            fg = colors.cyan,
            bold = true,
          },
          fill = {
            bg = colors.alt_bg,
          },
        },
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
