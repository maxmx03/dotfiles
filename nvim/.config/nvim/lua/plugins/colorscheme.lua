return {
  {
    'maxmx03/solarized.nvim',
    branch = 'dev',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').setup {
        transparent = true,
        theme = 'neo',
      }

      vim.cmd.colorscheme 'solarized'
    end,
  },
}
