return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      local colors = require 'dracula.palette'

      require('window-picker').setup {
        highlights = {
          statusline = {
            unfocused = {
              fg = colors.pink,
              bg = colors.base03,
              bold = true,
            },
          },
        },
      }
    end,
  },
}

