return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.markuplint,
        null_ls.builtins.diagnostics.checkmake,
      },
    }
  end,
}
