return {
  {
    'karb94/neoscroll.nvim',
    commit = '532dcc8cea4287c4cad6bb77532989a8217cfc7b',
    config = function()
      require('neoscroll').setup {}

      local t = {}
      t['<C-e>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }

      require('neoscroll.config').set_mappings(t)
    end,
  },
}
