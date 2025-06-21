return {
  'maxmx03/terminal.nvim',
  keys = {
    { mode = { 'n' }, '<leader>xx', '<cmd>TermOpen<cr>', desc = 'toggle Terminal' },
    { mode = { 't' }, '<leader>xx', '<cmd>TermHide<cr>', desc = 'toggle Terminal' },
    {
      mode = { 't', 'n' },
      '<ESC>',
      function()
        if vim.o.buftype == 'terminal' then
          vim.defer_fn(function()
            vim.cmd.TermHide()
          end, 0)
        end
      end,
      desc = 'exit terminal and move up',
    },
  },
  opts = {
    size = 0.3,
    layout = 'below',
  },
}
