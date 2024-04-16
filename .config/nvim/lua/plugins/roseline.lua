return {
  {
    'maxmx03/roseline',
    config = function()
      require('roseline').setup {
        theme = 'dracula',
        icons = {
          vim = '',
          diagnostic = {
            Ok = '󰟪',
          },
          os = {
            Linux = '󱄅',
          },
        },
      }
    end,
  },
}
