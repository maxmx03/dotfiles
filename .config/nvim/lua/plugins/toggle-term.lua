return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        shell = vim.o.shell,
        persist_size = false,
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
          width = 120,
          height = 25,
          winblend = 10,
        },
      }
    end,
  },
}
