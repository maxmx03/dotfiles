return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        shell = vim.o.shell,
        highlights = {
          NormalFloat = {
            link = 'NormalFloat',
          },
          FloatBorder = {
            link = 'WinSeparator',
          },
        },
        float_opts = {
          border = 'curved',
          width = 90,
          height = 15,
          winblend = 10,
        },
      }
    end,
  },
}
