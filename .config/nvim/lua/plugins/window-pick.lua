return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      local colors = require('fluoromachine.palette').get_colors()

      require('window-picker').setup {
        highlights = {
          statusline = {
            unfocused = {
              fg = colors.pink,
              bg = colors.comment,
              bold = true,
            },
          },
        },
      }
    end,
  },
}
