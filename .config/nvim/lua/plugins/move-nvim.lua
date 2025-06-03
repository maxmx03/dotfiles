return {
  'fedepujol/move.nvim',
  opts = {},
  keys = {
    { mode = 'v', '<a-up>', ':MoveBlock(-1)<cr>', desc = 'move block of code up' },
    { mode = 'v', '<a-down>', ':MoveBlock(1)<cr>', desc = 'move block of code up' },
  },
}
