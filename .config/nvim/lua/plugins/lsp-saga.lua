return {
  'nvimdev/lspsaga.nvim',
  keys = {
    { '<Leader>t', ':Lspsaga term_toggle<CR>', mode = 'n', desc = 'Open Terminal', silent = true },
    {
      '<Leader>t',
      '<C-\\><C-n> :Lspsaga term_toggle<CR>',
      mode = 't',
      desc = 'Close Terminal',
      silent = true,
    },
  },
  config = function()
    require('lspsaga').setup {}
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
