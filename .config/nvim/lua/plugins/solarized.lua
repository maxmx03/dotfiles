return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {
    variant = 'winter',
    transparent = {
      enabled = true,
      lazy = false,
      mason = false,
    },
    error_lens = {
      text = false,
      symbol = false,
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
    on_highlights = function(colors)
      ---@type solarized.highlights
      return {
        ['@function.call.bash'] = { link = 'Type' },
        TelescopePromptBorder = { fg = colors.blue },
      }
    end,
  },
  config = function(_, opts)
    require('solarized').setup(opts)
    vim.cmd.colorscheme 'solarized'
  end,
}
