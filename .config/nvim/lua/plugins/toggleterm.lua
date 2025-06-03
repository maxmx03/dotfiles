return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = true,
  keys = {
    { '<leader>xx', '<cmd>ToggleTerm<cr>', desc = 'open' },
    { '<leader>xt', '<cmd>Runner<cr>', desc = 'exec program' },
    { mode = { 't' }, '<leader>xx', '<cmd>ToggleTerm<cr>', desc = 'Hide' },
    { mode = 't', '<esc>', [[<c-\><c-n>]], desc = 'exit terminal' },
    { mode = 't', '<c-up>', [[<c-\><c-n><c-w>k]], desc = 'exit terminal and move up' },
  },
}
