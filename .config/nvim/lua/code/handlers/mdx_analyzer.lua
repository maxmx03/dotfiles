local function handlers()
  local lsp_config = require 'lspconfig'
  lsp_config.mdx_analyzer.setup {
    filetypes = { 'markdown.mdx', 'mdx' },
    single_file_support = true,
  }
end

return handlers
