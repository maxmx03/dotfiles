return {
  'maxmx03/diagpop.nvim',
  opts = {
    limit = 1,
    border = 'single',
    hl_group = 'Comment',
    severity = vim.diagnostic.severity.ERROR,
  },
  ft = { 'lua', 'c', 'cpp' },
}
