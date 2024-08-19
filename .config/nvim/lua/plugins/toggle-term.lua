return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'float',
      shell = vim.o.shell,
      highlights = {
        NormalFloat = {
          link = 'Normal',
        },
        FloatBorder = {
          link = 'FloatBorder',
        },
      },
      float_opts = {
        border = 'curved',
        width = 70,
        height = 15,
        -- winblend = 10,
      },
    },
  },
}
