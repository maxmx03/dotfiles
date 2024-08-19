return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup {
        highlights = {
          statusline = {
            unfocused = {
              fg = 'NvimLightGreen',
              bg = 'NvimDarkGray1',
              bold = true,
            },
          },
        },
      }
    end,
  },
}
