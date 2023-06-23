return {
  {
    'maxmx03/caelum.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').setup {
        transparent = false,
        highlights = function(colors)
          return {
            NvimTreeWindowPicker = { fg = colors.base0, bg = colors.base04 },
          }
        end,
      }

      vim.cmd.colorscheme 'solarized'
    end,
  },
}
