return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local solarized = require 'solarized'

    solarized.setup {
      transparent = true,
      theme = 'neo',
      highlights = function(colors, color)
        local darken = color.darken
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
          ['@markup.raw'] = { link = 'Comment' },
          ['@markup.heading.1.markdown'] = { fg = colors.red, bg = darken(colors.red, 50) },
          ['@markup.heading.2.markdown'] = { fg = colors.blue, bg = darken(colors.blue, 50) },
          ['@markup.heading.3.markdown'] = { fg = colors.yellow, bg = darken(colors.yellow, 50) },
          ['@markup.heading.4.markdown'] = { fg = colors.magenta, bg = darken(colors.magenta, 50) },
          ['@markup.heading.5.markdown'] = { fg = colors.violet, bg = darken(colors.violet, 50) },
        }
      end,
    }

    vim.cmd.colorscheme 'solarized'
  end,
}
