local M = {}

M.formatters = function(null_ls)
  return {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.shfmt,
  }
end

M.diagnostics = function(null_ls)
  return {
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.shellcheck,
  }
end

M.servers = {
  'lua_ls',
  'tsserver',
  'eslint',
  'html',
  'cssls',
  'cssmodules_ls',
  'emmet_ls',
  'vimls',
  'bashls',
  'marksman',
  'pyright',
  'rust_analyzer',
  'angularls',
  'astro',
  'intelephense',
  'dockerls',
  'yamlls',
  'gopls',
  'tailwindcss',
}

return M
