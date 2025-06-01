return {
  {
    -- WHY I DIDN'T USE THIS EARLIER?
    -- I'M SICK IN THE HEAD!
    'tpope/vim-fugitive',
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      word_diff = false,
      signs_staged = {
        add = { text = '+' },
        change = { text = '┃' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
    },
  },
}
