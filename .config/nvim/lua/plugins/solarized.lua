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
      return {
        ['@function.call.bash'] = { link = 'Type' },
        LspInlayHint = { fg = color.shade(colors.cyan, 3) },
      }
    end,
  },
  config = function(_, opts)
    require('solarized').setup(opts)
    vim.cmd.colorscheme 'solarized'
  end,
}
