return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      local code = require 'code'
      local sources = {}
      sources = vim.list_extend(sources, code.formatters(null_ls))
      sources = vim.list_extend(sources, code.diagnostics(null_ls))

      null_ls.setup {
        sources = sources,
      }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      automatic_installation = true,
    },
  },
}
