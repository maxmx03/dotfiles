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
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
