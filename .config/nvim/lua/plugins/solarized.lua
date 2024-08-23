return {
  'maxmx03/solarized.nvim',
  -- dir = '/home/milianor/GitHub/solarized.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require('solarized').setup(opts)
    vim.cmd.colorscheme 'solarized'
  end,
}
