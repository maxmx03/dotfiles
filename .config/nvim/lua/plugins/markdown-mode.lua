return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    ft = { 'markdown', 'mdx', 'markdown.mdx' },
    ---@type markview.config
    opts = {
      latex = {
        enable = true,
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
