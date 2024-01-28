return {
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {}

      local t = {}
      t['<C-e>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }

      require('neoscroll.config').set_mappings(t)
    end,
  },
}
