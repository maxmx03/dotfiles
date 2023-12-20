return {
  {
    'maxmx03/solarized.nvim',
    config = function()
      require('solarized').setup {
        theme = 'neo',
        transparent = true,
        highlights = {
          DashboardHeader = { fg = '#839496' },
          DashboardFooter = { fg = '#586e75' },
          DashboardKey = { fg = '#2aa198' },
          Directory = { fg = '#268bd2' },
        },
      }

      vim.cmd.colorscheme 'solarized'
    end,
  },
}
