local M = {}

M.on_attach = function(bufnr)
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format { bufnr = bufnr }
    end,
  })
end

return M
