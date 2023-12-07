return {
  {
    'glepnir/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup {
        symbol_in_winbar = {
          enable = false,
        },
      }
    end,
  },
}
