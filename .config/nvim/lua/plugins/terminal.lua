return {
  'maxmx03/terminal.nvim',
  keys = {
    { mode = { 'n' }, '<leader>xx', '<cmd>TermOpen<cr>', desc = 'toggle Terminal' },
    { mode = { 't' }, '<leader>xx', '<cmd>TermHide<cr>', desc = 'toggle Terminal' },
  },
  opts = {
    size = 0.3,
    layout = 'below',
  },
}
