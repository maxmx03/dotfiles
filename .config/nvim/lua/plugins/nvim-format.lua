return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      c = { lsp_format = 'prefer' },
      cpp = { lsp_format = 'prefer' },
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier' },
      typescript = { 'prettierd', 'prettier' },
      html = { 'prettierd', 'prettier' },
      css = { 'prettierd', 'prettier' },
      scss = { 'prettierd', 'prettier' },
      javascriptreact = { 'prettierd', 'prettier' },
      typescriptreact = { 'prettierd', 'prettier' },
      svelte = { 'prettierd', 'prettier' },
      vue = { 'prettierd', 'prettier' },
      json = { 'prettierd', 'prettier' },
      markdown = { 'prettierd', 'prettier' },
      mdx = { 'prettierd', 'prettier' },
      sh = { 'shfmt' },
      python = { 'black' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
      stop_after_first = true,
    },
    format_on_save = {
      timeout_ms = 500,
      stop_after_first = true,
      lsp_format = 'fallback',
    },
  },
  config = function(_, opts)
    local conform = require 'conform'
    conform.setup(opts)
    vim.api.nvim_create_user_command('Conform', function()
      conform.format {}
    end, {})
  end,
}
