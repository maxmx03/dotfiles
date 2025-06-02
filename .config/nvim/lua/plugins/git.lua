return {
  {
    'tpope/vim-fugitive',
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      word_diff = false,
      signs = {
        delete = { text = '󰍵' },
        changedelete = { text = '󱕖' },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '┃' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
    },
    keys = {
      { '<leader>gn', '<cmd>Gitsigns next_hunk<cr>', desc = 'next hunk' },
      { '<leader>gp', '<cmd>Gitsigns prev_hunk<cr>', desc = 'prev hunk' },
      { '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', desc = 'stage hunk' },
      { '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<cr>', desc = 'undo stage hunk' },
      { '<leader>gg', '<cmd>Gitsigns preview_hunk<cr>', desc = 'preview hunk' },
    },
  },
}
