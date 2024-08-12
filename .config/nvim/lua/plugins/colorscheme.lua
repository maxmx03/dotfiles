return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local solarized = require 'solarized'
      vim.o.background = 'dark'
      solarized.setup {
        transparent = true,
        theme = 'neo',
        highlights = function(colors)
          return {
            Constant = { link = 'Number' },
            Identifier = { fg = colors.blue },
            ['@module'] = { fg = colors.magenta },
            ['@variable'] = { fg = colors.blue },
            ['@variable.builtin'] = { fg = colors.magenta },
            ['@variable.parameter'] = { fg = colors.blue, italic = true },
            ['@lsp.type.parameter'] = { link = '@variable.parameter' },
            ['@type.builtin'] = { link = 'Keyword' },
            Type = { fg = colors.red },
            ['@constructor'] = { link = 'Type' },
            ['@tag'] = { fg = colors.red },
            ['@tag.delimiter'] = { fg = colors.red },
            ['@character.printf'] = { fg = colors.magenta },
            Function = { fg = colors.yellow },
            Directory = { fg = colors.cyan },
            DashboardHeader = { fg = colors.base0 },
            ['@constant.html'] = { link = '@tag' },
            Title = { fg = colors.red },
          }
        end,
      }

      vim.cmd.colorscheme 'solarized'
    end,
  },
}
