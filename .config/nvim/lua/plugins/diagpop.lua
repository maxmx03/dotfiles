return {
  'maxmx03/diagpop.nvim',
  opts = {
    limit = 5,
    hl_group = 'FloatBorder',
    border = 'single', -- single, double, rounded, shadow, none
    relative = 'editor', -- editor, cursor
    -- filter
    severity = vim.diagnostic.severity.ERROR, -- vim.diagnostic.severity.ERROR | WARN | INFO | HINT
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
