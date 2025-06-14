return {
  'maxmx03/terminal.nvim',
  keys = {
    { mode = { 'n' }, '<leader>xx', '<cmd>TermOpen<cr>', desc = 'toggle Terminal' },
    { mode = { 't' }, '<leader>xx', '<cmd>TermHide<cr>', desc = 'toggle Terminal' },
    {
      mode = 't',
      '<c-up>',
      function()
        vim.cmd.stopinsert()
        vim.defer_fn(function()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<C-w>k', true, false, true),
            'n',
            true
          )
        end, 0)
      end,
      desc = 'exit terminal and move up',
    },
  },
  opts = {
    size = 0.3,
    layout = 'below',
  },
}
