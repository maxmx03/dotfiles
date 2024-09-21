local icons = require 'lsp-easy.icons'

---@class lsp-easy.config
local config = {
  formatters = {},
  diagnostics = {},
  on_attach = nil,
  servers = {},
  handlers = {},
  virtual_text = {
    prefix = '󱋊',
  },
  signs = {
    Error = icons.Error,
    Warn = icons.Warning,
    Hint = icons.Hint,
    Info = icons.Information,
  },
}

return config
