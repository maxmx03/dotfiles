local null_ls = require 'null-ls'
local mason = require 'mason-null-ls'

local M = {}

---@param opts lsp-easy.config
M.load = function(opts)
  local sources = {}
  sources = vim.list_extend(sources, opts.formatters(null_ls))
  sources = vim.list_extend(sources, opts.diagnostics(null_ls))
  mason.setup {
    automatic_installation = true,
  }
  null_ls.setup {
    sources = sources,
  }
end

return M
