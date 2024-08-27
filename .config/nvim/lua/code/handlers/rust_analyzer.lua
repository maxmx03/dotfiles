local function handler()
  local lsp_config = require 'lspconfig'
  local opts = {
    tools = {
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = '<- ',
        other_hints_prefix = '=> ',
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = 'Comment',
      },
    },
    server = {
      standalone = true,
    },
  }
  lsp_config.rust_analyzer.setup(opts)
end

return handler
