return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {
    transparent = {
      enabled = true,
      lazy = false,
    },
    plugins = {
      ale = false,
      coc = false,
      leap = false,
      alpha = false,
      yanky = false,
      neogit = false,
      noice = false,
      nvimtree = false,
      navic = false,
      ministarter = false,
      minitabline = false,
      ministatusline = false,
      todocomments = false,
      rainbowdelimiters = false,
    },
    on_highlights = function(colors, color)
      ---@type solarized.highlights
      local groups = {
        ['@tag'] = { fg = colors.green },
        ['@tag.attribute'] = { fg = colors.blue },
        Delimiter = { fg = colors.red },
        Keyword = { link = 'Statement' },
        Type = { fg = colors.red },
      }
      return groups
    end,
  },
  config = function(_, opts)
    require('solarized').setup(opts)
    vim.cmd.colorscheme 'solarized'
  end,
}
