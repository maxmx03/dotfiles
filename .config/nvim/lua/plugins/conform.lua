local unix = require 'include.unix'
local formatters = unix.ls 'config/formatters'
local formatters_by_ft = {}
for _, formatter in pairs(formatters) do
  local languages = require('config.formatters.' .. formatter)
  for _, language in pairs(languages) do
    local lang_entry = formatters_by_ft[language] ~= nil
    if not lang_entry then
      formatters_by_ft[language] = {}
    end
    table.insert(formatters_by_ft[language], formatter)
  end
end

return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = formatters_by_ft,
    c = { lsp_format = 'prefer' },
    cpp = { lsp_format = 'prefer' },
    default_format_opts = {
      lsp_format = 'fallback',
      stop_after_first = true,
    },
    -- format_on_save = {
    --   timeout_ms = 500,
    --   stop_after_first = true,
    --   lsp_format = 'fallback',
    -- },
  },
  config = function(_, opts)
    local conform = require 'conform'
    conform.setup(opts)
    vim.api.nvim_create_user_command('Conform', function()
      conform.format {}
    end, {})
  end,
}
