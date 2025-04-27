return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'OXY2DEV/helpview.nvim',
    lazy = false, -- Recommended
    ft = 'help',
    commit = '857aec1dab331252910da158ab6cbfbc65239c71', -- best version
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
