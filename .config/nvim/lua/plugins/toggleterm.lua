return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { mode = { 'n', 't' }, '<leader>xx', '<cmd>ToggleTerm<cr>', desc = 'toggle Terminal' },
      { mode = { 'n', 't' }, '<leader>x1', '<cmd>ToggleTerm 1<cr>', desc = 'toggle Terminal 1' },
      { mode = { 'n', 't' }, '<leader>x2', '<cmd>ToggleTerm 2<cr>', desc = 'toggle Terminal 2' },
      { mode = 't', '<c-up>', [[<c-\><c-n><c-w>k]], desc = 'exit terminal and move up' },
      { mode = 't', '<c-left>', [[<c-\><c-n><c-w>h]], desc = 'exit terminal and move left' },
      { mode = 't', '<c-right>', [[<c-\><c-n><c-w>l]], desc = 'exit terminal and move right' },
    },
    config = true,
  },
}
