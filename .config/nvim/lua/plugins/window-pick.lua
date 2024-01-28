return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      local colors = require 'rose-pine.palette'

      require('window-picker').setup {
        highlights = {
          statusline = {
            unfocused = {
              fg = colors.foam,
              bg = colors.base,
              bold = true,
            },
          },
        },
      }
    end,
  },
}
