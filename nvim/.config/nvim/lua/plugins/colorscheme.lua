return {
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('fluoromachine').setup {
        transparent = false,
        glow = true,
        theme = 'delta',
        brightness = 0.15,
      }

      vim.cmd.colorscheme 'fluoromachine'
    end,
  },
}
