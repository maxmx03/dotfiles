return {
  {
    'SmiteshP/nvim-navic',
    config = function()
      local navic = require 'nvim-navic'
      local breadcrumbs = require 'core.navic.breadcrumbs'

      breadcrumbs.create_winbar()

      navic.setup {
        highlight = true,
        depth_limit = 0,
        depth_limit_indicator = '..',
      }
    end,
  },
}
