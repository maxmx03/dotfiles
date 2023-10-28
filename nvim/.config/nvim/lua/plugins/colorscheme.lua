return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    branch = 'dev',
    config = function()
      require('solarized').setup {
        transparent = true,
        theme = 'neo',
        enables = {
          neotree = false,
          indentblankline = false,
        },
      }

      vim.cmd.colorscheme 'solarized'
    end,
  },
}
