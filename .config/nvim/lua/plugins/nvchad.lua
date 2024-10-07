return {
  {
    'nvchad/ui',
    dependencies = {
      'NvChad/volt',
    },
    config = function()
      require 'nvchad'
    end,
  },
  {
    -- 'nvchad/base46',
    'maxmx03/base46',
    build = function()
      require('base46').load_all_highlights()
    end,
  },
  {
    'nvchad/minty',
    lazy = true,
    dependencies = {
      'NvChad/volt',
    },
  },
  {
    'nvchad/menu',
    lazy = true,
    dependencies = {
      'NvChad/volt',
    },
  },
  {
    'nvchad/showkeys',
    lazy = true,
  },
}
