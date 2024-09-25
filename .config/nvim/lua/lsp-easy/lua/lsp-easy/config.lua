local icons = require 'lsp-easy.icons'

local source = function(_)
  return {}
end

---@class lsp-easy.config
local config = {
  lspconfig = {},
  formatters = source,
  diagnostics = source,
  completions = source,
  hovers = source,
  code_actions = source,
  servers = {},
  handlers = {},
  mason_lspconfig = {
    automatic_installation = true,
  },
  mason_installer = {
    auto_update = true,
  },
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
