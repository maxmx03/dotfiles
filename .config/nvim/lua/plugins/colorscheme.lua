return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local solarized = require 'solarized'

      solarized.setup {
        transparent = true,
        theme = 'neo',
        highlights = function(colors)
          return {
            Constant = { link = 'Number' },
            Identifier = { fg = colors.blue },
            ['@variable'] = { fg = colors.blue },
            ['@variable.builtin'] = { fg = colors.purple },
            ['@type.builtin'] = { link = 'Keyword' },
            ['@constructor'] = { link = 'Type' },
            ['@tag'] = { fg = colors.red },
            ['@tag.delimiter'] = { fg = colors.red },
            Directory = { fg = colors.cyan },
            DashboardHeader = { fg = colors.base0 },
            ['@constant.html'] = { link = '@tag' },
          }
        end,
      }

      vim.cmd.colorscheme 'solarized'
    end,
  },
}
