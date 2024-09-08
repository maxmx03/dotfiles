return {
  dir = vim.fn.stdpath 'config' .. '/lua/github',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = {
      enabled = true,
      lazy = false,
      mason = false,
      neotree = false,
    },
  },
  config = function(_, opts)
    require('github').setup(opts)
    vim.cmd.colorscheme 'github'
  end,
}
