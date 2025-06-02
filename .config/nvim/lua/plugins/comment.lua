return {
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    keys = {
      { mode = { 'v' }, '<leader>/', '<Plug>(comment_toggle_linewise_visual)', desc = 'comment' },
        { '<leader>/', '<Plug>(comment_toggle_linewise_current)', desc = 'comment' },
    },
  },
}
