return {
  {
    'maxmx03/solarized.nvim',
    config = function()
      require('solarized').setup {
        theme = 'neo',
        transparent = true,
      }

      vim.cmd.colorscheme 'solarized'
    end,
  },
}
