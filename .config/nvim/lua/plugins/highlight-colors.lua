return {
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {
        render = 'first_column',
        enable_named_colors = false,
        enable_tailwind = true,
      }
    end,
  },
}
