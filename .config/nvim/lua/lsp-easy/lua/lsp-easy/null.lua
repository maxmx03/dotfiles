local null_ls = require 'null-ls'
local mason = require 'mason-null-ls'

local M = {}

---@param opts lsp-easy.config
M.load = function(opts)
  local sources = {}
  sources = vim.list_extend(sources, opts.formatters(null_ls.builtins.formatting))
  sources = vim.list_extend(sources, opts.diagnostics(null_ls.builtins.diagnostics))
  sources = vim.list_extend(sources, opts.completions(null_ls.builtins.completion))
  sources = vim.list_extend(sources, opts.code_actions(null_ls.builtins.code_actions))
  sources = vim.list_extend(sources, opts.hovers(null_ls.builtins.hover))
  mason.setup {
    automatic_installation = true,
  }
  null_ls.setup {
    sources = sources,
  }
end

return M
