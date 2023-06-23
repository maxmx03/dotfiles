return {
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = { 'markdown' },
    config = function()
      vim.g.mkdp_theme = 'dark'
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },
}
