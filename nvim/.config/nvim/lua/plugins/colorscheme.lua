return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local darken = require('solarized.utils.colors').darken
      require('solarized').setup {
        theme = 'neo',
        transparent = true,
        highlights = {
          DashboardHeader = { fg = '#839496' },
          DashboardFooter = { fg = '#586e75' },
          DashboardKey = { fg = '#2aa198' },
          Directory = { fg = '#268bd2' },
          Title = { fg = '#268bd2' },
          NoiceFormatProgressTodo = {
            fg = '#2aa198',
            bg = darken('#2aa198', 80),
            reverse = false,
          },
        },
      }
      vim.cmd.colorscheme 'solarized'
    end,
  },
}
