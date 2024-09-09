local handler = function()
  local lsp_config = require 'lspconfig'

  lsp_config.emmet_ls.setup {
    filetypes = {
      'html',
      'php',
      'jsx',
      'tsx',
      'astro',
      'mdx',
    },
  }
end

return handler
