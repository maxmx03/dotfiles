local M = {}

M.formatters = function(null_ls)
  return {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
  }
end

M.diagnostics = function(null_ls)
  return {
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.markuplint,
  }
end

M.servers = {
  'lua_ls',
  'eslint',
  'ts_ls',
  'html',
  'cssls',
  'cssmodules_ls',
  'emmet_ls',
  'vimls',
  'bashls',
  'marksman',
  'pylsp',
  'rust_analyzer',
  'angularls',
  'astro',
  'intelephense',
  'dockerls',
  'yamlls',
  'gopls',
  'tailwindcss',
  'mdx_analyzer',
  'jsonls',
}

return M
